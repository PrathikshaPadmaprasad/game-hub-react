import { Badge, ColorModeContext } from "@chakra-ui/react";
import React from "react";

interface Props {
  score: number;
}

const CriticScore = ({ score }: Props) => {
  let color = score > 75 ? "green" : score > 60 ? "yellow" : " ";
  return (
    <Badge colorScheme={color} fontSize={14} paddingX={2} borderRadius={4}>
      {score}
    </Badge>
  );
};

export default CriticScore;
