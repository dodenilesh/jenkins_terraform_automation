et -x

function create_credential()
{
	    JENKINS_URL="http://localhost:8080"
	        USERNAME="admin"
		    PASSWORD="password"    
		        SSH_PORT=22
			    USERID="ubuntu"
			        CRED_ID="k8s_master17"


				    
				    # Creating CMD utility for jenkins-cli commands
				        jenkins_cmd="java -jar /var/lib/jenkins/jenkins-cli.jar -s $JENKINS_URL -auth $USERNAME:$PASSWORD"
					    $jenkins_cmd delete-credentials system::system::jenkins _ $CRED_ID

					        cat > /tmp/cred.xml <<EOF
<com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey plugin="ssh-credentials@1.16">
  <scope>GLOBAL</scope>
  <id>$CRED_ID</id>
  <description>Generated via Terraform for $SLAVE_IP</description>
  <username>$USERID</username>
  <privateKeySource class="com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey\$DirectEntryPrivateKeySource">
<privateKey>
LR8HHkMhNaMgVWMXnNsh72t1jyZz5O974WS13I73pkvHKhgblHU1e0/Oz9O7XEipI1F8AQ
2BmBTRKVW9qQvnca5PmSShvyN893xnZxG40tXdiLPK7UQvMMnmHJd1ouhI4zSJ4zIWka4k
Vvf+onxc09t4FbUaS1WmZuz+JkjWd3eJA6LMTIZUK08wHLqhwqL8T1fd6/l9STLG4x6xvk
tQS+IKazoi23EacxfwOyPceR3iBlQHAAAAwQC6N3T1jPKoMzEuAvvrXrnG8cnkgzx8xXzF
oqDuYb/vyqQLurPssGAi7uMnyqD0QB7wLiDkByQNa24CNpyGR1o4SyEs3jcfpQFIrdrSne
EzvQ5mKSP4Av+KN//cwnk7WvHu8LEkaUVWN5RVgpFwYA+srLZZQ0V1OMXnJDIeHRpMMrhc
4ZI+l8STQkQwXwg91nzuUYrGtMsIQY47+wAlSCydK9Tes6ARFYY/30qJx9NAAPaxrEBA2w
KIVNhNgqTojjcAAAAib2VtQG9lbS1IUC1QYXZpbGlvbi0xNS1Ob3RlYm9vay1QQwE=
-----END OPENSSH PRIVATE KEY-----</privateKey>
  </privateKeySource>
  </com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey>
EOF

cat > /tmp/github_creds.xml <<EOF
<com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl>
  <id>GITHUB_CREDS</id>
  <username>dodenilesh</username>
  <password>Blockchain@86056</password>
  <description>Github credentials</description>
</com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl>
EOF
cat /tmp/cred.xml | $jenkins_cmd create-credentials-by-xml system::system::jenkins _
cat /tmp/github_creds.xml | $jenkins_cmd create-credentials-by-xml system::system::jenkins _
}

create_credential
echo "done"
exit 0
