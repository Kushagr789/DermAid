

import 'package:camera/camera.dart';
import 'package:derm_aid/Widgets/NumStepper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'PreviewPage.dart';

class CameraScan extends StatefulWidget {
  const CameraScan({super.key,required this.cameras});
  final List<CameraDescription>? cameras;
  @override
  State<CameraScan> createState() => _CameraScanState();
}

class _CameraScanState extends State<CameraScan> {

  late CameraController _cameraController;
  bool _isRearCameraSelected=true;
  double zoom=1.0;

  @override
  void dispose() {
    // TODO: implement dispose
    _cameraController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCamera(widget.cameras![0]);
  }


  Future takePicture()async{
    if(!_cameraController.value.isInitialized){
      return null;
    }
    if(_cameraController.value.isTakingPicture){
      return null;
    }
    try{

      await _cameraController.setFocusMode(FocusMode.auto);

      XFile picture=await _cameraController.takePicture();

      Navigator.push(context, MaterialPageRoute(builder: (context)=>PreviewPage(
        picture: picture,
      )));
    }on CameraException catch(e){

      debugPrint("Error occured while taking picture: $e");
      return null;
    }
  }
  Future initCamera(CameraDescription cameraDescription) async{
    _cameraController=CameraController(cameraDescription, ResolutionPreset.high);
    try{
      await _cameraController.initialize().then((_){
        if(!mounted)return;
        setState(() {

        });
      });
    }on CameraException catch(e){
      debugPrint("camera error $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,size: 24,color: Color.fromRGBO(188, 188, 188, 1),)
        ),
        backgroundColor: Color.fromRGBO(39, 39, 39, 1),
        elevation: 0,
        centerTitle: true,
        title: Text("Scan",
          style: TextStyle(
            color: Color.fromRGBO(188, 188, 188, 1),
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.question_mark_rounded,color: Color.fromRGBO(188, 188, 188, 1),size: 30,))
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            (_cameraController.value.isInitialized)?
                Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: Center(
                    child: Container(
                      width: size.width*0.95,
                      height: size.width*0.95,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(size.width*0.475),
                        child: CameraPreview(_cameraController),
                      ),
                    )
                  ),
                ):
                Container(
                  color: Colors.black,
                  child: Center(child: CircularProgressIndicator(),),
                ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: size.height*0.11,
                color: Color.fromRGBO(39, 39, 39, 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NumStepper(
                      totalSteps: 4,
                      width: MediaQuery.of(context).size.width,
                      curStep: 2,
                      stepCompColor: Color.fromRGBO(76, 239, 19, 1),
                      currentStepColor: Color.fromRGBO(74, 213, 205, 1),
                      inactiveColor: Color.fromRGBO(188, 188, 188, 1),
                      lineWidth: 1,
                    ),],
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height*0.17,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  color: Color.fromRGBO(39, 39, 39, 1)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      color: Color.fromRGBO(94, 94, 94, 1),
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){
                            setState(() {
                              (zoom>1.0)?zoom=zoom-1.0:zoom;
                            });
                            _cameraController.setZoomLevel(zoom);
                          },
                            icon: Icon(
                              FontAwesomeIcons.minus,
                              color: Color.fromRGBO(188, 188, 188, 1),
                              size: 20,
                            ),
                          ),
                          Slider(value: zoom,
                            max: 8.0,
                            min: 0.0,
                            activeColor: Color.fromRGBO(74, 213, 205, 1),
                            inactiveColor: Colors.black,
                            onChanged: (value){
                            setState(() {
                              zoom=value;
                            });
                            _cameraController.setZoomLevel(zoom);
                            },
                            ),
                          IconButton(onPressed: (){
                            setState(() {
                              (zoom<8.0)?zoom=zoom+1.0:zoom;
                            });
                            _cameraController.setZoomLevel(zoom);
                          },
                            icon: Icon(
                              FontAwesomeIcons.plus,
                              color: Color.fromRGBO(188, 188, 188, 1),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    Expanded(
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center,children: [
                        Expanded(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              _isRearCameraSelected?Icons.switch_camera
                                  :Icons.switch_camera_sharp,
                              color: Colors.white,
                              size: 40,
                            ),
                            onPressed: (){
                              setState(() =>_isRearCameraSelected=!_isRearCameraSelected);
                              initCamera(widget.cameras![_isRearCameraSelected?0:1]);
                            },
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async{

                              await takePicture();

                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(74, 213, 205, 1),
                                shape: BoxShape.circle
                              ),
                              child: Center(
                                child: Container(

                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(74, 213, 205, 1),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white,style: BorderStyle.solid,width: 5.0,strokeAlign: BorderSide.strokeAlignOutside)
                                  ),
                                ),
                              ),
                            ),

                          )
                        ),
                        Expanded(
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.photo_library,
                              color: Colors.white,
                              size: 40,
                            ),
                            onPressed: () async{
                              final picker = ImagePicker();
                              final pickedImage = await picker.pickImage(source: ImageSource.gallery);

                              if (pickedImage != null) {
                                XFile picture=pickedImage;
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>PreviewPage(
                                  picture: picture,
                                )));
                              }
                              },
                            )
                        ),
                      ],),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
