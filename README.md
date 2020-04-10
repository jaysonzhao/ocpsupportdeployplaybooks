
一、脚本的目录结构



```
|-- camelLogsApp.yml   
|-- hosts			    
`-- roles
    |-- camelLogsApp
    |   |-- files
    |   |   `-- templane.yml
    |   |-- handlers
    |   |   `-- main.yml
    |   |-- meta
    |   |-- tasks
    |   |   `-- main.yml
    |   |-- templates
    |   |   |-- camelLogsApp-template.json
    |   |   `-- springboot-s2i.json
    |   `-- vars
    |       `-- main.yml
    |-- config.yml

```





```

|-- camelLogsApp.yml :执行脚本
|-- hosts: ansible hosts目录
|-- roles
	|--role_name/：我们定义的role的名字
		file/：用于存放copy或script等模块调用的函数
		tasks/:用于定义各种task，此目录一定要有main.yml;其他文件需要main.yml包含调用
		handlers：用于定义各种handlers，此目录一定要有main.yml;其他文件需要main.yml包含调用
		vars:用于定义variables，此目录一定要有main.yml;其他文件需要main.yml包含调用
		templates/：存储由template模块调用的模板文本；
		meta/：定义当前角色的特殊设定及其依赖关系，此目录中至少应该有一个名为main.yml的文件；其它的文件需要由main.yml进行“包含”调用；
		default/：此目录中至少应该有一个名为main.yml的文件，用于设定默认变量；
	|-- config.yml ：统一配置文件
	
```
	
	
	

二、脚本应用包含：
		
	activeMq、mysql5_6、keycloak、gogs、nexus3
	
	

三、执行安装脚本之前预先修改配置信息(config.yml内容说明)

	token: Zjyw1LZKVmIPQyngaYwZf2FipOYAhj8ILDFBTA_jBjk
	loginurl: https://api.abocp.sandbox735.opentlc.com:6443
	projectname: corespaceapp 																			(项目名) 
	namespace: corespaceapp  																			(命名空间)
	user: admin																							(ocp的账号)
	password: redhat																					(ocp的密码)
	
	keycloaksvcName: keycloak-db      																	(keycloak postger的数据库service name)
	postgerUser: keycloak			  																	(keycloak postger的数据库账号)
	postgerPwd: keycloak			  																	(keycloak postger的数据库密码)
	database: keycloakdb			  																	(keycloak postger的数据库密码)
	keycloakUser: admin				  																	(keycloak 账号)
	keycloakPwd: admin				  																	(keycloak 密码)
	keycloahostname: sso-keycloak.apps.hzocp.sandbox801.opentlc.com   									(keycloak 的路由)
	

	
	gogshosename: gogs.apps.abocp.sandbox735.opentlc.com										        (gogs路由路径)			
	
	
四、注意点：

	在ocp安装corepanel、app等应用的前需要安预先安装基础应用，既：mysql、activeMq、keycloak、gogs、nexus3，所以在安装业务应用时需要基础环境
	安装顺序为：mysql、activeMq、keycloak、gogs、nexus3

五、执行安装命令：

1、执行mysql安装脚本
				              
	ansible-playbook  \
        	-i hosts  \         指定hosts文件     
	     mysql5_6.yml \    	    指定安装需要安装应用脚本 
	--force-handlers  
	

2、执行activeMq安装脚本

    `ansible-playbook  -i hosts    activeMq.yml    --force-handlers  `

