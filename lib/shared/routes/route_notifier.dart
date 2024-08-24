import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/signin/presentation/sign_in_page.dart';
import 'route_names.dart';

class RouterNotifier extends ChangeNotifier {
  RouterNotifier() {}

  String? redirectLogic(BuildContext context, GoRouterState state) {
    if (state.matchedLocation == RouteNames.signInRoute ||
        state.matchedLocation == RouteNames.signUpRoute) {
      return null;
    } else {
      return RouteNames.signInRoute;
    }
  }

  String? onAuthenticated(BuildContext context, GoRouterState state) {
    if (state.matchedLocation == RouteNames.defaultRoute) {
      return RouteNames.homeRoute;
    } else {
      return null;
    }
  }

  List<GoRoute> get routes {
    return [
      GoRoute(
        name: RouteNames.defaultNameRoute,
        path: RouteNames.defaultRoute,
        builder: (context, state) =>
            Scaffold(backgroundColor: Colors.white, body: Text('Default')),
      ),
      GoRoute(
        name: RouteNames.homeNameRoute,
        path: RouteNames.homeRoute,
        builder: (context, state) =>
            Scaffold(backgroundColor: Colors.white, body: Text('Home')),
      ),
      GoRoute(
        name: RouteNames.signInNameRoute,
        path: RouteNames.signInRoute,
        builder: (context, state) => const SignInPage(),
      ),
      // GoRoute(
      //   name: RouteNames.termsAndConditionNameRoute,
      //   path: RouteNames.termsAndConditionRoute,
      //   builder: (context, state) => TCPage(),
      // ),
      // GoRoute(
      //     name: RouteNames.imeiInstructionNameRoute,
      //     path: RouteNames.imeiInstructionRoute,
      //     builder: (context, state) {
      //       final isUnlink = state.extra as bool?;
      //       return ImeiIntroductionPage(isUnlink: isUnlink);
      //     }),

      // GoRoute(
      //     name: RouteNames.homeNameRoute,
      //     path: RouteNames.homeRoute,
      //     builder: (context, state) => const HomePage(),
      //     routes: [
      //       GoRoute(
      //           name: RouteNames.permissionNameRoute,
      //           path: RouteNames.permissionRoute,
      //           builder: (context, state) => const PermissionPage()),
      //       GoRoute(
      //         name: RouteNames.riwayatAbsenNameRoute,
      //         path: RouteNames.riwayatAbsenRoute,
      //         builder: (context, state) {
      //           final isFromAbsen = state.extra as bool?;
      //           return RiwayatAbsenPage(isFromAbsen: isFromAbsen);
      //         },
      //       ),
      //       GoRoute(
      //         name: RouteNames.profileNameRoute,
      //         path: RouteNames.profileRoute,
      //         builder: (context, state) => const ProfilePage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.absenTersimpanNameRoute,
      //         path: RouteNames.absenTersimpanRoute,
      //         builder: (context, state) => BackgroundPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.absenNameRoute,
      //         path: RouteNames.absenRoute,
      //         builder: (context, state) => AbsenPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.copyrightNameRoute,
      //         path: RouteNames.copyrightRoute,
      //         builder: (context, state) => CopyRightPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.sakitListNameRoute,
      //         path: RouteNames.sakitListRoute,
      //         builder: (context, state) => SakitListPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.createSakitNameRoute,
      //         path: RouteNames.createSakitRoute,
      //         builder: (context, state) => CreateSakitPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.editSakitNameRoute,
      //         path: RouteNames.editSakitRoute,
      //         builder: (context, state) {
      //           final cuti = state.extra as Map<String, dynamic>;
      //           final _data = SakitList.fromJson(cuti);
      //           return EditSakitPage(_data);
      //         },
      //       ),
      //       GoRoute(
      //           name: RouteNames.sakitDtlNameRoute,
      //           path: RouteNames.sakitDtlRoute,
      //           builder: (context, state) {
      //             final id = state.extra as int;
      //             return SakitDtlPageBy(id);
      //           }),
      //       GoRoute(
      //           name: RouteNames.sakitUploadNameRoute,
      //           path: RouteNames.sakitUploadRoute,
      //           builder: (context, state) {
      //             final id = state.extra as int;
      //             return SakitUploadPage(id);
      //           }),
      //       GoRoute(
      //           name: RouteNames.sakitPhotoDtlNameRoute,
      //           path: RouteNames.sakitPhotoDtlRoute,
      //           builder: (context, state) {
      //             final imageUrl = state.extra as String;
      //             return SakitDtlPhotoPage(imageUrl: imageUrl);
      //           }),
      //       GoRoute(
      //         name: RouteNames.cutiListNameRoute,
      //         path: RouteNames.cutiListRoute,
      //         builder: (context, state) => CutiListPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.createCutiNameRoute,
      //         path: RouteNames.createCutiRoute,
      //         builder: (context, state) => CreateCutiPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.editCutiNameRoute,
      //         path: RouteNames.editCutiRoute,
      //         builder: (context, state) {
      //           final cuti = state.extra as Map<String, dynamic>;
      //           final _data = CutiList.fromJson(cuti);
      //           return EditCutiPage(_data);
      //         },
      //       ),
      //       GoRoute(
      //         name: RouteNames.izinListNameRoute,
      //         path: RouteNames.izinListRoute,
      //         builder: (context, state) => IzinListPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.createIzinNameRoute,
      //         path: RouteNames.createIzinRoute,
      //         builder: (context, state) => CreateIzinPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.editIzinNameRoute,
      //         path: RouteNames.editIzinRoute,
      //         builder: (context, state) {
      //           final absen = state.extra as Map<String, dynamic>;
      //           final _data = IzinList.fromJson(absen);
      //           return EditIzinPage(_data);
      //         },
      //       ),
      //       GoRoute(
      //           name: RouteNames.izinDtlNameRoute,
      //           path: RouteNames.izinDtlRoute,
      //           builder: (context, state) {
      //             final id = state.extra as int;
      //             return IzinDtlPageBy(id);
      //           }),
      //       GoRoute(
      //           name: RouteNames.izinUploadNameRoute,
      //           path: RouteNames.izinUploadRoute,
      //           builder: (context, state) {
      //             final id = state.extra as int;
      //             return IzinUploadPage(id);
      //           }),
      //       GoRoute(
      //           name: RouteNames.izinPhotoDtlNameRoute,
      //           path: RouteNames.izinPhotoDtlRoute,
      //           builder: (context, state) {
      //             final imageUrl = state.extra as String;
      //             return IzinDtlPhotoPage(imageUrl: imageUrl);
      //           }),
      //       GoRoute(
      //         name: RouteNames.dtPcListNameRoute,
      //         path: RouteNames.dtPcListRoute,
      //         builder: (context, state) => DtPcListPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.createDtPcNameRoute,
      //         path: RouteNames.createDtPcRoute,
      //         builder: (context, state) => CreateDtPcPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.editDtPcNameRoute,
      //         path: RouteNames.editDtPcRoute,
      //         builder: (context, state) {
      //           final absen = state.extra as Map<String, dynamic>;
      //           final _data = DtPcList.fromJson(absen);
      //           return EditDtPcPage(_data);
      //         },
      //       ),
      //       GoRoute(
      //         name: RouteNames.absenManualListNameRoute,
      //         path: RouteNames.absenManualListRoute,
      //         builder: (context, state) => AbsenManualListPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.createAbsenManualNameRoute,
      //         path: RouteNames.createAbsenManualRoute,
      //         builder: (context, state) => CreateAbsenManualPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.editAbsenManualNameRoute,
      //         path: RouteNames.editAbsenManualRoute,
      //         builder: (context, state) {
      //           final absen = state.extra as Map<String, dynamic>;
      //           final _data = AbsenManualList.fromJson(absen);
      //           return EditAbsenManualPage(_data);
      //         },
      //       ),
      //       GoRoute(
      //         name: RouteNames.tugasDinasListNameRoute,
      //         path: RouteNames.tugasDinasListRoute,
      //         builder: (context, state) => TugasDinasListPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.createTugasDinasNameRoute,
      //         path: RouteNames.createTugasDinasRoute,
      //         builder: (context, state) => CreateTugasDinasPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.editTugasDinasNameRoute,
      //         path: RouteNames.editTugasDinasRoute,
      //         builder: (context, state) {
      //           final tugas = state.extra as Map<String, dynamic>;
      //           final _data = TugasDinasList.fromJson(tugas);
      //           return EditTugasDinasPage(_data);
      //         },
      //       ),
      //       GoRoute(
      //         name: RouteNames.searchPemberiTugasDinasNameRoute,
      //         path: RouteNames.searchPemberiTugasDinasRoute,
      //         builder: (context, state) => SearchPemberiTugas(),
      //       ),
      //       GoRoute(
      //           name: RouteNames.tugasDinasDtlNameRoute,
      //           path: RouteNames.tugasDinasDtlRoute,
      //           builder: (context, state) {
      //             final id = state.extra as int;
      //             return TugasDinasDtlPageBy(id);
      //           }),
      //       GoRoute(
      //           name: RouteNames.tugasDinasUploadNameRoute,
      //           path: RouteNames.tugasDinasUploadRoute,
      //           builder: (context, state) {
      //             final id = state.extra as int;
      //             return TugasDinasUploadPage(id);
      //           }),
      //       GoRoute(
      //           name: RouteNames.tugasDinasPhotoDtlNameRoute,
      //           path: RouteNames.tugasDinasPhotoDtlRoute,
      //           builder: (context, state) {
      //             final imageUrl = state.extra as String;
      //             return TugasDinasDtlPhotoPage(imageUrl: imageUrl);
      //           }),
      //       GoRoute(
      //         name: RouteNames.gantiHariListNameRoute,
      //         path: RouteNames.gantiHariListRoute,
      //         builder: (context, state) => GantiHariListPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.createGantiHariNameRoute,
      //         path: RouteNames.createGantiHariRoute,
      //         builder: (context, state) => CreateGantiHariPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.editGantiHariNameRoute,
      //         path: RouteNames.editGantiHariRoute,
      //         builder: (context, state) {
      //           final dayoff = state.extra as Map<String, dynamic>;
      //           final _data = GantiHariList.fromJson(dayoff);
      //           return EditGantiHariPage(_data);
      //         },
      //       ),
      //       GoRoute(
      //         name: RouteNames.lemburListNameRoute,
      //         path: RouteNames.lemburListRoute,
      //         builder: (context, state) => LemburListPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.createLemburNameRoute,
      //         path: RouteNames.createLemburRoute,
      //         builder: (context, state) => CreateLemburPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.editLemburNameRoute,
      //         path: RouteNames.editLemburRoute,
      //         builder: (context, state) {
      //           final dayoff = state.extra as Map<String, dynamic>;
      //           final _data = LemburList.fromJson(dayoff);
      //           return EditLemburPage(_data);
      //         },
      //       ),
      //       GoRoute(
      //         name: RouteNames.slipGajiNameRoute,
      //         path: RouteNames.slipGajiRoute,
      //         builder: (context, state) => SlipGajiPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.viewSuratNameRoute,
      //         path: RouteNames.viewSuratRoute,
      //         builder: (context, state) {
      //           final id = state.extra as int;
      //           return TugasDinasViewSuratPage(id);
      //         },
      //       ),
      //       GoRoute(
      //         name: RouteNames.jadwalShiftListNameRoute,
      //         path: RouteNames.jadwalShiftListRoute,
      //         builder: (context, state) => JadwalShiftListPage(),
      //       ),
      //       GoRoute(
      //         name: RouteNames.createJadwalShiftNameRoute,
      //         path: RouteNames.createJadwalShiftRoute,
      //         builder: (context, state) => CreateJadwalShiftPage(),
      //       ),
      //     ]),
    ];
  }
}
