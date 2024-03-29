import 'package:flutter/material.dart';

class TermosDeUso extends StatelessWidget {
  const TermosDeUso({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Termos de Uso', style: TextStyle(color: Color(0xff87986A))),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leadingWidth: 70,
          leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon:  Icon(Icons.arrow_back_sharp, color: Color(0xff87986A)),
          label: const Text(''),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
          child: Text(
              "1. ACEITA estado, a Av. Paulista, 1079 – 7º andar, e de agora em diante denominada simplesmente de Webnow. Este “Termo de Uso de Aplicativo” rege o uso de todos os aplicativos disponibilizados gratuitamente pela Webnow sejam para dispositivos móveis (Android, IOS, Windows Mobile), servidores, computadores pessoais (desktops) ou serviços web. Se você não concordar com estes termos não use este aplicativo.Você reconhece ainda que analisou e aceitou as condições de uso. Leia-as atentamente pois o uso desteaplicativo significa que você aceitou todos os termos e concorda em cumpri-los. Se você, usuário, for menor deidade ou declarado incapaz em quaisquer aspectos, precisará da permissão de seus pais ou responsáveis quetambém deverão concordar com estes mesmos termos e condições.2. LICENÇA LIMITADAVocê recebeu uma licença limitada, não transferível, não exclusiva, livre de royalties e revogável para baixar,instalar, executar e utilizar este aplicativo em seu dispositivo. Você reconhece e concorda que a Webnowconcede ao usuário uma licença exclusiva para uso e desta forma não lhe transfere os direitos sobre o produto.O aplicativo deverá ser utilizado por você, usuário. A venda, transferência, modificação, engenharia reversa oudistribuição bem como a cópia de textos, imagens ou quaisquer partes nele contido é expressamente proibida.3. ALTERAÇÕES, MODIFICAÇÕES E RESCISÃOA Webnow reserva-se no direito de, a qualquer tempo, modificar estes termos seja incluindo, removendo oualterando quaisquer de suas cláusulas. Tais modificações terão efeito imediato. Após publicadas tais alterações,ao continuar com o uso do aplicativo, você terá aceitado e concordado em cumprir os termos modificados.A Webnow pode, de tempos em tempos, modificar ou descontinuar (temporária ou permanentemente) adistribuição ou a atualização deste aplicativo.A Webnow não é obrigada a fornecer nenhum serviço de suporte para este aplicativo.O usuário não poderá responsabilizar a Webnow nem seus diretores, executivos, funcionários, afiliados, agentes,contratados ou licenciadores por quaisquer modificações, suspensões ou descontinuidade do aplicativo.CONSENTIMENTO PARA COLETA E USO DE DADOSVocê concorda que a Webnow pode coletar e usar dados técnicos de seu dispositivo tais como especificações,configuras, verss de sistema operacional, tipo de conexão à internet e afins.ISENO DE GARANTIAS E LIMITAES DE RESPONSABILIDADEEste aplicativo estará em contínuo desenvolvimento e pode conter erros e, por isso, o uso é fornecido e sob risco do usuário final. Na extensão máxima permitida pela legislação aplicávela Webnow e seus fornecedores isentam-se de quaisquer garantias e condições expressas ou implícitas incluindo,sem limitação, garantias de comercialização, adequação a um propósito específico, titularidade e não violação noque diz respeito ao aplicativo e qualquer um de seus componentes ou ainda à prestação ou não de serviços desuporte. A Webnow não garante que a operação deste aplicativo seja contínua e sem defeitos.Exceto pelo estabelecido neste documento não há outras garantias, condições ou promessas aos aplicativos,expressas ou implícitas, e todas essas garantias, condições e promessas podem ser excluídas de acordo com oque é permitido por lei sem prejuízo à Webnow e seus colaboradores.I. A Webnow não garante, declara ou assegura que o uso deste aplicativo será ininterrupto ou livre de errose você concorda que a Webnow poderá remover por períodos indefinidos ou cancelar este aplicativo a qualquermomento sem que você seja avisado.II. A Webnow não garante, declara nem assegura que este aplicativo esteja livre de perda, interrupção,ataque, vírus, interferência, pirataria ou outra invasão de segurança e isenta-se de qualquer responsabilidade emrelação à essas questões. Você é responsável pelo backup do seu próprio dispositivo.III. Em hipótese alguma a Webnow, bem como seus diretores, executivos, funcionários, afiliadas, agentes,contratados ou licenciadores responsabilizar-se-ão por perdas ou danos causados pelo uso do aplicativo.iV. Os conteúdos transmitidos pelos aplicativos tais como a transmissão da programação de rádios AM, FM,programações televisivas e afins são de responsabilidade de seus idealizadores. A Webnow isenta-se de qualquerresponsabilidade direta ou indireta sobre estes conteúdos e o acesso é facultativo ao usuário."),
        ),
      ),
    );
  }
}
