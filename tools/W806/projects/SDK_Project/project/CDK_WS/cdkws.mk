.PHONY: clean All Project_Title Project_Build Project_PostBuild

All: Project_Title Project_Build Project_PostBuild

Project_Title:
	@echo "----------Building project:[ W806_SDK - BuildSet ]----------"

Project_Build:
	@make -r -f W806_SDK.mk -j 6 -C  W806_SDK 

Project_PostBuild:
	@echo Executing Post Build commands ...
	@cd "W806_SDK" && export CDKPath="D:/C-Sky/CDK" CDK_VERSION="V2.10.3" ProjectPath="D:/PROJECT_SDK/WM_SDK_W806_v0.6.0/WM_SDK_W806_7735r/tools/W806/projects/SDK_Project/project/CDK_WS/W806_SDK/" && ../../../../../../../tools/W806/utilities/cdk_aft_build.sh;../../../../../../../tools/W806/utilities/aft_build_project.sh 
	@echo Done


clean:
	@echo "----------Cleaning project:[ W806_SDK - BuildSet ]----------"

