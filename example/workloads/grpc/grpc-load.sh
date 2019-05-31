# basic bash script for load testing the grpc service.
kubectl port-forward svc/fortune-teller-app 8080:80 &
for i in {1..1200}; do grpcurl -v -plaintext localhost:8080 build.stack.fortune.FortuneTeller/Predict; done 
