ns='petclinic'

string=$(kubectl get ns -o json)
if [[ $string != *$ns* ]]; then
  echo "It's not there!"
fi
