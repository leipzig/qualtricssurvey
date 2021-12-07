library(ggplot2)
library(readxl)
library(dplyr)
library("wesanderson")

read_excel("question3.12.xlsx") %>% dplyr::arrange(Mean,Maximum) -> question3_12
question3_12$fill<-(as.integer(row.names(question3_12)) %% 2 == 0)
ggplot(question3_12, aes(x=reorder(Field, -Mean), y=Mean, fill=fill)) +
  geom_bar(position=position_dodge(), stat="identity",colour='black') +
  geom_errorbar(aes(ymin=Mean-StdDeviation, ymax=Mean+StdDeviation), width=.2) + 
  scale_fill_manual(values = wes_palette("Darjeeling1")) +
  ylab("Mean Rank") +
  xlab("Factor") +
  coord_flip() +
  theme(axis.text = element_text(size = 20)) + theme(axis.title = element_text(size = 24)) +
  guides(fill="none")
ggsave("3_12.png")

read_excel("question7.11.xlsx") %>% dplyr::arrange(Mean,Maximum) -> question7_11
question7_11$fill<-(as.integer(row.names(question7_11)) %% 2 == 0)
ggplot(question7_11, aes(x=reorder(Field, -Mean), y=Mean, fill=fill)) +
  geom_bar(position=position_dodge(), stat="identity",colour='black') +
  geom_errorbar(aes(ymin=Mean-StdDeviation, ymax=Mean+StdDeviation), width=.2) + 
  scale_fill_manual(values = wes_palette("Darjeeling1")) +
  ylab("Mean Rank") +
  xlab("Factor") +
  coord_flip() +
  theme(axis.text = element_text(size = 20)) + theme(axis.title = element_text(size = 24)) +
  guides(fill="none")
ggsave("q7_11.png")