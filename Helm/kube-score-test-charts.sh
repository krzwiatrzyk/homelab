CHARTS_TO_TEST=(strimzi-kafka-operator vault)

for CHART in ${CHARTS_TO_TEST[@]}; do
  helm template ${CHART} Charts/${CHART} | kubectl score -
  echo "Continue [enter]?" && read -n 1
done