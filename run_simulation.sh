#!/bin/bash

# Modify the .cmnd file based on environment variables
sed -i "s/Main:numberCount = .*/Main:numberCount = 10000/" /home/cards_semileptonic_electrons/${CARD}
sed -i "s/Main:numberShowInfo = .*/Main:numberShowInfo = 1/" /home/cards_semileptonic_electrons/${CARD}
sed -i "s/Main:numberShowProcess = .*/Main:numberShowProcess = 1/" /home/cards_semileptonic_electrons/${CARD}
sed -i "s/Main:numberShowEvent = .*/Main:numberShowEvent = 1/" /home/cards_semileptonic_electrons/${CARD}

#Pileup in Pythia
# sed -i "s/SoftQCD:all = .*/SoftQCD:all  = on/" /home/cards/${CARD}
# sed -i "/^! 4) Settings for the hard-process generation.$/aSoftQCD:all = on                   ! Allow total sigma = elastic/SD/DD/ND" /home/cards/${CARDS}

sed -i "s/Main:numberOfEvents = .*/Main:numberOfEvents = ${NUMBER_OF_EVENTS}/" /home/cards_semileptonic_electrons/${CARD}
sed -i "s/Beams:eCM = .*/Beams:eCM = ${ECM}./" /home/cards_semileptonic_electrons/${CARD}
sed -i "s/PhaseSpace:mHatMin = .*/PhaseSpace:mHatMin = ${MHATMIN}/" /home/cards_semileptonic_electrons/${CARD}

# Run the simulation
# I want the output name to containe the card mhat and number of events
./Delphes-3.5.0/DelphesPythia8 ./Delphes-3.5.0/cards/delphes_card_ATLAS.tcl /home/cards_semileptonic_electrons/${CARD} output/${CARD}_${ECM}_${MHATMIN}.root
