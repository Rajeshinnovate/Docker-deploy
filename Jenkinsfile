node {
   // This is to demo github action	
   //def sonarUrl = 'sonar.host.url=http://172.31.30.136:9000'
   //def mvn = tool (name: 'maven3', type: 'maven') + '/bin/mvn'
   stage('SCM Checkout'){
    // Clone repo
	git branch: 'master', 
	//credentialsId: 'github', 
	url: 'https://github.com/Rajeshinnovate/Docker-deploy.git'
   
   }
   
	
   stage('Mvn Package'){
	   // Build using maven
	   
	   sh "mvn clean install package"
   }
   
   stage('deploy-dev'){
       def tomcatDevIp = '172.31.35.18'
	   def tomcatHome = '/opt/apache-tomcat-8.5.35'
	   def webApps = tomcatHome+'webapps/'
	   def tomcatStart = "${tomcatHome}bin/startup.sh"
	   def tomcatStop = "${tomcatHome}bin/shutdown.sh"
	   
	   sshagent (credentials: ['tomcat-dev']) {
	      sh "scp -o StrictHostKeyChecking=no target/myweb*.war ansadmin@${tomcatDevIp}:${webApps}myweb.war"
          sh "ssh ansadmin@${tomcatDevIp} ${tomcatStop}"
		  sh "ssh ansadmin@${tomcatDevIp} ${tomcatStart}"
       }
   }
   stage('Email Notification'){
		mail bcc: '', body: """Hi Team, You build successfully deployed
		                       Job URL : ${env.JOB_URL}
							   Job Name: ${env.JOB_NAME}
Thanks,
DevOps Team""", cc: '', from: '', replyTo: '', subject: "${env.JOB_NAME} Success", to: 'hari.kammana@gmail.com'
   
   }
}
