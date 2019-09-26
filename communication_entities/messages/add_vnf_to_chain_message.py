from communication_entities.messages.abstract_message import AbstractMessage
from utilities.logger import *


class AddVNFToChainMessage(AbstractMessage):

    def __init__(self, data):
        super().__init__(data)
        self.current_server = None

    def process_message(self):
        log.info("Adding VNF to the chain...")
        self.current_server.orchestrator.add_affected_vnf(self.data)

