import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const NftContractModule = buildModule("NftContractModule", (m) => {
//   const unlockTime = m.getParameter("unlockTime", JAN_1ST_2030);
//   const lockedAmount = m.getParameter("lockedAmount", ONE_GWEI);

  const levNft = m.contract("LevNFT", []);

  return { levNft };
});

export default NftContractModule;
