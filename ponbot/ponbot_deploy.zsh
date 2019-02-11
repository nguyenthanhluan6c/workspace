
ponbot_local_deploy(){
  echo "Start Deploy"
  (cd ~/ruby/ponbot/) &&
  (sam package --template-file template.yaml --s3-bucket ponbot-dev --output-template-file packaged.yaml) &&
  (sam deploy --template-file ./packaged.yaml --stack-name ponbot20181106 --capabilities CAPABILITY_IAM);
  echo "Deploy Done!"
}
