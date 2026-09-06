.class public final Lz1/L2;
.super Ljava/lang/Object;
.source "ModelInitializer.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lz1/L2$a;,
        Lz1/L2$b;
    }
.end annotation


# static fields
.field public static final m:Lz1/L2$a;


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Ls1/X$b;

.field private final c:Ls1/P;

.field private final d:Lcom/android/launcher3/F1;

.field private final e:Ln1/C;

.field private final f:LD1/t;

.field private final g:Lcom/android/launcher3/util/p2;

.field private final h:Ls1/V;

.field private final i:Lk2/k;

.field private final j:LD1/b;

.field private final k:Lcom/android/launcher3/util/K;

.field public l:LS1/a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lz1/L2$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lz1/L2$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lz1/L2;->m:Lz1/L2$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ls1/X$b;Ls1/P;Lcom/android/launcher3/F1;Ln1/C;LD1/t;Lcom/android/launcher3/util/p2;Ls1/V;Lk2/k;LD1/b;Lcom/android/launcher3/util/K;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "iconPool"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "iconCache"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "idp"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "themeManager"

    .line 22
    .line 23
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string v0, "userCache"

    .line 27
    .line 28
    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string v0, "settingsCache"

    .line 32
    .line 33
    invoke-static {p7, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const-string v0, "iconProvider"

    .line 37
    .line 38
    invoke-static {p8, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const-string v0, "customWidgetManager"

    .line 42
    .line 43
    invoke-static {p9, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const-string v0, "installSessionHelper"

    .line 47
    .line 48
    invoke-static {p10, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const-string v0, "lifeCycle"

    .line 52
    .line 53
    invoke-static {p11, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Lz1/L2;->a:Landroid/content/Context;

    .line 60
    .line 61
    iput-object p2, p0, Lz1/L2;->b:Ls1/X$b;

    .line 62
    .line 63
    iput-object p3, p0, Lz1/L2;->c:Ls1/P;

    .line 64
    .line 65
    iput-object p4, p0, Lz1/L2;->d:Lcom/android/launcher3/F1;

    .line 66
    .line 67
    iput-object p5, p0, Lz1/L2;->e:Ln1/C;

    .line 68
    .line 69
    iput-object p6, p0, Lz1/L2;->f:LD1/t;

    .line 70
    .line 71
    iput-object p7, p0, Lz1/L2;->g:Lcom/android/launcher3/util/p2;

    .line 72
    .line 73
    iput-object p8, p0, Lz1/L2;->h:Ls1/V;

    .line 74
    .line 75
    iput-object p9, p0, Lz1/L2;->i:Lk2/k;

    .line 76
    .line 77
    iput-object p10, p0, Lz1/L2;->j:LD1/b;

    .line 78
    .line 79
    iput-object p11, p0, Lz1/L2;->k:Lcom/android/launcher3/util/K;

    .line 80
    .line 81
    return-void
.end method

.method private static final A(Lcom/android/launcher3/D3;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->a0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final B(Lz1/L2;Lcom/android/launcher3/util/p2$a;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lz1/L2;->g:Lcom/android/launcher3/util/p2;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/util/p2;->i:Landroid/net/Uri;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private static final C(Lz1/L2;Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Landroid/content/ComponentName;

    .line 4
    .line 5
    iget-object p0, p0, Lz1/L2;->a:Landroid/content/Context;

    .line 6
    .line 7
    const-class v0, Lcom/android/launcher3/notification/NotificationListener;

    .line 8
    .line 9
    invoke-direct {p1, p0, v0}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Landroid/service/notification/NotificationListenerService;->requestRebind(Landroid/content/ComponentName;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method private static final D(Lz1/L2;Lcom/android/launcher3/util/p2$a;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lz1/L2;->g:Lcom/android/launcher3/util/p2;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/util/p2;->h:Landroid/net/Uri;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private static final E(Lcom/android/launcher3/D3;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p1, "pref_smartspace_home_screen"

    .line 2
    .line 3
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->a0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private static final F(Lz1/L2;Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/J3;->c:Lcom/android/launcher3/J3$a;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/L2;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/J3$a;->g(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private static final G(Lz1/L2;Lcom/android/launcher3/D3;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Lz1/L2;->U(Lz1/L2;Lcom/android/launcher3/D3;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private static final H(Lz1/L2;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lz1/L2;->w()LS1/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, LS1/a;->a()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private static final I(Lcom/android/launcher3/D3;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->p1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final J(Lz1/L2;Lcom/android/launcher3/util/p2$a;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lz1/L2;->g:Lcom/android/launcher3/util/p2;

    .line 2
    .line 3
    sget-object v0, LR0/k;->f:LR0/k$a;

    .line 4
    .line 5
    invoke-virtual {v0}, LR0/k$a;->a()Landroid/net/Uri;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private static final K(Lz1/L2;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "status"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lz1/L2;->a:Landroid/content/Context;

    .line 7
    .line 8
    invoke-static {p0, p1}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->W(Landroid/content/Context;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private static final L(Lz1/L2;Lcom/android/launcher3/util/p2$b;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lz1/L2;->g:Lcom/android/launcher3/util/p2;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->d:Landroid/net/Uri;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/util/p2;->q(Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private static final M(Lcom/android/launcher3/D3;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "appPackages"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/android/launcher3/D3;->C0(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static final N(Lz1/L2;Lcom/android/launcher3/util/p2$b;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lz1/L2;->g:Lcom/android/launcher3/util/p2;

    .line 2
    .line 3
    sget-object v0, Lcom/android/launcher3/util/p2;->o:Landroid/net/Uri;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/util/p2;->q(Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private static final O(Lz1/L2;Ln1/C$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/L2;->e:Ln1/C;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ln1/C;->p(Ln1/C$d;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private static final P(Landroid/content/pm/LauncherApps;Lz1/Q2;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/content/pm/LauncherApps;->unregisterCallback(Landroid/content/pm/LauncherApps$Callback;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final Q(Lcom/android/launcher3/D3;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->N0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final R(Lcom/android/launcher3/util/x2;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/util/x2;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final S(Lcom/android/launcher3/D3;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->x1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final T(Lcom/android/launcher3/util/x2;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/util/x2;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final U(Lz1/L2;Lcom/android/launcher3/D3;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lz1/L2;->b:Ls1/X$b;

    .line 2
    .line 3
    invoke-virtual {v0}, Ls1/X$b;->a()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lz1/L2;->c:Ls1/P;

    .line 7
    .line 8
    iget-object p0, p0, Lz1/L2;->d:Lcom/android/launcher3/F1;

    .line 9
    .line 10
    iget v1, p0, Lcom/android/launcher3/F1;->O0:I

    .line 11
    .line 12
    iget p0, p0, Lcom/android/launcher3/F1;->N0:I

    .line 13
    .line 14
    invoke-virtual {v0, v1, p0}, Lt1/f;->R(II)Z

    .line 15
    .line 16
    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    const-string p0, "ModelInitializer"

    .line 20
    .line 21
    const-string p1, "refreshAndReloadLauncher: switchStreamer return"

    .line 22
    .line 23
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->a0()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/D3;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lz1/L2;->E(Lcom/android/launcher3/D3;Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lz1/L2;Lcom/android/launcher3/F1$d;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/L2;->z(Lz1/L2;Lcom/android/launcher3/F1$d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lz1/L2;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/L2;->C(Lz1/L2;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/util/x2;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lz1/L2;->T(Lcom/android/launcher3/util/x2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lz1/L2;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/L2;->J(Lz1/L2;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lz1/L2;Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/L2;->F(Lz1/L2;Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lz1/L2;Lcom/android/launcher3/D3;ZZZZZZ)V
    .locals 0

    .line 1
    invoke-static/range {p0 .. p7}, Lz1/L2;->y(Lz1/L2;Lcom/android/launcher3/D3;ZZZZZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lz1/L2;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lz1/L2;->H(Lz1/L2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/android/launcher3/D3;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/L2;->I(Lcom/android/launcher3/D3;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Lcom/android/launcher3/D3;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/L2;->Q(Lcom/android/launcher3/D3;Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lz1/L2;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/L2;->D(Lz1/L2;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Lcom/android/launcher3/util/x2;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lz1/L2;->R(Lcom/android/launcher3/util/x2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Lcom/android/launcher3/D3;Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/L2;->A(Lcom/android/launcher3/D3;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Lz1/L2;Ln1/C$d;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/L2;->O(Lz1/L2;Ln1/C$d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Lz1/L2;Lcom/android/launcher3/util/p2$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/L2;->L(Lz1/L2;Lcom/android/launcher3/util/p2$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Lcom/android/launcher3/D3;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/L2;->M(Lcom/android/launcher3/D3;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Lcom/android/launcher3/D3;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/L2;->S(Lcom/android/launcher3/D3;Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Lz1/L2;Lcom/android/launcher3/util/p2$b;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/L2;->N(Lz1/L2;Lcom/android/launcher3/util/p2$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s(Lz1/L2;Lcom/android/launcher3/util/p2$a;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/L2;->B(Lz1/L2;Lcom/android/launcher3/util/p2$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t(Landroid/content/pm/LauncherApps;Lz1/Q2;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/L2;->P(Landroid/content/pm/LauncherApps;Lz1/Q2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Lz1/L2;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/L2;->K(Lz1/L2;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic v(Lz1/L2;Lcom/android/launcher3/D3;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lz1/L2;->G(Lz1/L2;Lcom/android/launcher3/D3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final y(Lz1/L2;Lcom/android/launcher3/D3;ZZZZZZ)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-static {p0, p1, p4}, Lz1/L2;->U(Lz1/L2;Lcom/android/launcher3/D3;Z)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method private static final z(Lz1/L2;Lcom/android/launcher3/F1$d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/L2;->d:Lcom/android/launcher3/F1;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/F1;->O0(Lcom/android/launcher3/F1$d;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final V(LS1/a;)V
    .locals 1

    .line 1
    const-string v0, "<set-?>"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lz1/L2;->l:LS1/a;

    .line 7
    .line 8
    return-void
.end method

.method public final w()LS1/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lz1/L2;->l:LS1/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "mThemeManagerMFV"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final x(Lcom/android/launcher3/D3;)V
    .locals 6

    .line 1
    const-string v0, "model"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lz1/n2;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Lz1/n2;-><init>(Lz1/L2;Lcom/android/launcher3/D3;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lz1/L2;->d:Lcom/android/launcher3/F1;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lcom/android/launcher3/F1;->j0(Lcom/android/launcher3/F1$d;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lz1/L2;->k:Lcom/android/launcher3/util/K;

    .line 17
    .line 18
    new-instance v2, Lz1/p2;

    .line 19
    .line 20
    invoke-direct {v2, p0, v0}, Lz1/p2;-><init>(Lz1/L2;Lcom/android/launcher3/F1$d;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Lz1/u2;

    .line 27
    .line 28
    invoke-direct {v0, p0, p1}, Lz1/u2;-><init>(Lz1/L2;Lcom/android/launcher3/D3;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lz1/L2;->e:Ln1/C;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ln1/C;->h(Ln1/C$d;)Z

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lz1/L2;->k:Lcom/android/launcher3/util/K;

    .line 37
    .line 38
    new-instance v2, Lz1/v2;

    .line 39
    .line 40
    invoke-direct {v2, p0, v0}, Lz1/v2;-><init>(Lz1/L2;Ln1/C$d;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->x0()Lz1/Q2;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v1, p0, Lz1/L2;->a:Landroid/content/Context;

    .line 51
    .line 52
    const-class v2, Landroid/content/pm/LauncherApps;

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    check-cast v1, Landroid/content/pm/LauncherApps;

    .line 62
    .line 63
    sget-object v2, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 64
    .line 65
    invoke-virtual {v2}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v1, v0, v3}, Landroid/content/pm/LauncherApps;->registerCallback(Landroid/content/pm/LauncherApps$Callback;Landroid/os/Handler;)V

    .line 70
    .line 71
    .line 72
    iget-object v3, p0, Lz1/L2;->k:Lcom/android/launcher3/util/K;

    .line 73
    .line 74
    new-instance v4, Lz1/w2;

    .line 75
    .line 76
    invoke-direct {v4, v1, v0}, Lz1/w2;-><init>(Landroid/content/pm/LauncherApps;Lz1/Q2;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 80
    .line 81
    .line 82
    sget-boolean v3, Lcom/android/launcher3/N5;->h:Z

    .line 83
    .line 84
    if-eqz v3, :cond_0

    .line 85
    .line 86
    invoke-static {}, Lcom/android/launcher3/y0;->b0()Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-eqz v3, :cond_0

    .line 91
    .line 92
    new-instance v3, Landroid/content/pm/LauncherApps$ArchiveCompatibilityParams;

    .line 93
    .line 94
    invoke-direct {v3}, Landroid/content/pm/LauncherApps$ArchiveCompatibilityParams;-><init>()V

    .line 95
    .line 96
    .line 97
    const/4 v4, 0x0

    .line 98
    invoke-virtual {v3, v4}, Landroid/content/pm/LauncherApps$ArchiveCompatibilityParams;->setEnableUnarchivalConfirmation(Z)V

    .line 99
    .line 100
    .line 101
    invoke-static {}, Lcom/android/launcher3/y0;->I0()Z

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    xor-int/lit8 v4, v4, 0x1

    .line 106
    .line 107
    invoke-virtual {v3, v4}, Landroid/content/pm/LauncherApps$ArchiveCompatibilityParams;->setEnableIconOverlay(Z)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1, v3}, Landroid/content/pm/LauncherApps;->setArchiveCompatibility(Landroid/content/pm/LauncherApps$ArchiveCompatibilityParams;)V

    .line 111
    .line 112
    .line 113
    :cond_0
    new-instance v1, Lcom/android/launcher3/util/x2;

    .line 114
    .line 115
    iget-object v3, p0, Lz1/L2;->a:Landroid/content/Context;

    .line 116
    .line 117
    sget-object v4, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 118
    .line 119
    new-instance v5, Lz1/x2;

    .line 120
    .line 121
    invoke-direct {v5, p1}, Lz1/x2;-><init>(Lcom/android/launcher3/D3;)V

    .line 122
    .line 123
    .line 124
    invoke-direct {v1, v3, v4, v5}, Lcom/android/launcher3/util/x2;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Ljava/util/function/Consumer;)V

    .line 125
    .line 126
    .line 127
    const-string v3, "android.app.action.DEVICE_POLICY_RESOURCE_UPDATED"

    .line 128
    .line 129
    filled-new-array {v3}, [Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-virtual {v1, v3}, Lcom/android/launcher3/util/x2;->q([Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-object v3, p0, Lz1/L2;->k:Lcom/android/launcher3/util/K;

    .line 137
    .line 138
    new-instance v5, Lz1/z2;

    .line 139
    .line 140
    invoke-direct {v5, v1}, Lz1/z2;-><init>(Lcom/android/launcher3/util/x2;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v3, v5}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 144
    .line 145
    .line 146
    new-instance v1, Lcom/android/launcher3/util/x2;

    .line 147
    .line 148
    iget-object v3, p0, Lz1/L2;->a:Landroid/content/Context;

    .line 149
    .line 150
    new-instance v5, Lz1/A2;

    .line 151
    .line 152
    invoke-direct {v5, p1}, Lz1/A2;-><init>(Lcom/android/launcher3/D3;)V

    .line 153
    .line 154
    .line 155
    invoke-direct {v1, v3, v4, v5}, Lcom/android/launcher3/util/x2;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Ljava/util/function/Consumer;)V

    .line 156
    .line 157
    .line 158
    const-string v3, "android.intent.action.USER_UNLOCKED"

    .line 159
    .line 160
    filled-new-array {v3}, [Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    invoke-virtual {v1, v3}, Lcom/android/launcher3/util/x2;->q([Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    iget-object v3, p0, Lz1/L2;->k:Lcom/android/launcher3/util/K;

    .line 168
    .line 169
    new-instance v4, Lz1/B2;

    .line 170
    .line 171
    invoke-direct {v4, v1}, Lz1/B2;-><init>(Lcom/android/launcher3/util/x2;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 175
    .line 176
    .line 177
    iget-object v1, p0, Lz1/L2;->a:Landroid/content/Context;

    .line 178
    .line 179
    const-class v3, Landroid/os/UserManager;

    .line 180
    .line 181
    invoke-virtual {v1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    check-cast v1, Landroid/os/UserManager;

    .line 186
    .line 187
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    invoke-virtual {v1, v3}, Landroid/os/UserManager;->isUserUnlocked(Landroid/os/UserHandle;)Z

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    new-instance v3, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 198
    .line 199
    .line 200
    const-string v4, "initialize userUnlocked: "

    .line 201
    .line 202
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v3

    .line 212
    const-string v4, "ModelInitializer"

    .line 213
    .line 214
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    .line 216
    .line 217
    if-eqz v1, :cond_1

    .line 218
    .line 219
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->u0()Z

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    if-nez v1, :cond_1

    .line 224
    .line 225
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->z1()V

    .line 226
    .line 227
    .line 228
    :cond_1
    iget-object v1, p0, Lz1/L2;->k:Lcom/android/launcher3/util/K;

    .line 229
    .line 230
    iget-object v3, p0, Lz1/L2;->f:LD1/t;

    .line 231
    .line 232
    new-instance v4, Lz1/C2;

    .line 233
    .line 234
    invoke-direct {v4, p1}, Lz1/C2;-><init>(Lcom/android/launcher3/D3;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v3, v4}, LD1/t;->i(Ljava/util/function/BiConsumer;)Lcom/android/launcher3/util/a2;

    .line 238
    .line 239
    .line 240
    move-result-object v3

    .line 241
    invoke-virtual {v1, v3}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 242
    .line 243
    .line 244
    new-instance v1, Lz1/y2;

    .line 245
    .line 246
    invoke-direct {v1, p1}, Lz1/y2;-><init>(Lcom/android/launcher3/D3;)V

    .line 247
    .line 248
    .line 249
    iget-object v3, p0, Lz1/L2;->g:Lcom/android/launcher3/util/p2;

    .line 250
    .line 251
    sget-object v4, Lcom/android/launcher3/util/p2;->i:Landroid/net/Uri;

    .line 252
    .line 253
    invoke-virtual {v3, v4, v1}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 254
    .line 255
    .line 256
    iget-object v3, p0, Lz1/L2;->k:Lcom/android/launcher3/util/K;

    .line 257
    .line 258
    new-instance v4, Lz1/D2;

    .line 259
    .line 260
    invoke-direct {v4, p0, v1}, Lz1/D2;-><init>(Lz1/L2;Lcom/android/launcher3/util/p2$a;)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 264
    .line 265
    .line 266
    new-instance v1, Lz1/E2;

    .line 267
    .line 268
    invoke-direct {v1, p0}, Lz1/E2;-><init>(Lz1/L2;)V

    .line 269
    .line 270
    .line 271
    iget-object v3, p0, Lz1/L2;->g:Lcom/android/launcher3/util/p2;

    .line 272
    .line 273
    sget-object v4, Lcom/android/launcher3/util/p2;->h:Landroid/net/Uri;

    .line 274
    .line 275
    invoke-virtual {v3, v4, v1}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 276
    .line 277
    .line 278
    iget-object v3, p0, Lz1/L2;->g:Lcom/android/launcher3/util/p2;

    .line 279
    .line 280
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/p2;->f(Landroid/net/Uri;)Z

    .line 281
    .line 282
    .line 283
    move-result v3

    .line 284
    invoke-interface {v1, v3}, Lcom/android/launcher3/util/p2$a;->onSettingsChanged(Z)V

    .line 285
    .line 286
    .line 287
    iget-object v3, p0, Lz1/L2;->k:Lcom/android/launcher3/util/K;

    .line 288
    .line 289
    new-instance v4, Lz1/F2;

    .line 290
    .line 291
    invoke-direct {v4, p0, v1}, Lz1/F2;-><init>(Lz1/L2;Lcom/android/launcher3/util/p2$a;)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 295
    .line 296
    .line 297
    invoke-static {}, Lcom/android/launcher3/y0;->Z()Z

    .line 298
    .line 299
    .line 300
    move-result v1

    .line 301
    if-eqz v1, :cond_2

    .line 302
    .line 303
    new-instance v1, Lz1/G2;

    .line 304
    .line 305
    invoke-direct {v1, p1}, Lz1/G2;-><init>(Lcom/android/launcher3/D3;)V

    .line 306
    .line 307
    .line 308
    sget-object v3, Lcom/android/launcher3/J3;->c:Lcom/android/launcher3/J3$a;

    .line 309
    .line 310
    iget-object v4, p0, Lz1/L2;->a:Landroid/content/Context;

    .line 311
    .line 312
    invoke-virtual {v3, v4}, Lcom/android/launcher3/J3$a;->g(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 313
    .line 314
    .line 315
    move-result-object v3

    .line 316
    invoke-interface {v3, v1}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 317
    .line 318
    .line 319
    iget-object v3, p0, Lz1/L2;->k:Lcom/android/launcher3/util/K;

    .line 320
    .line 321
    new-instance v4, Lz1/H2;

    .line 322
    .line 323
    invoke-direct {v4, p0, v1}, Lz1/H2;-><init>(Lz1/L2;Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 324
    .line 325
    .line 326
    invoke-virtual {v3, v4}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 327
    .line 328
    .line 329
    :cond_2
    iget-object v1, p0, Lz1/L2;->k:Lcom/android/launcher3/util/K;

    .line 330
    .line 331
    iget-object v3, p0, Lz1/L2;->i:Lk2/k;

    .line 332
    .line 333
    new-instance v4, Lz1/I2;

    .line 334
    .line 335
    invoke-direct {v4, p1}, Lz1/I2;-><init>(Lcom/android/launcher3/D3;)V

    .line 336
    .line 337
    .line 338
    invoke-virtual {v3, v4}, Lk2/k;->g(Ljava/lang/Runnable;)Lcom/android/launcher3/util/a2;

    .line 339
    .line 340
    .line 341
    move-result-object v3

    .line 342
    invoke-virtual {v1, v3}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 343
    .line 344
    .line 345
    new-instance v1, Lz1/L2$b;

    .line 346
    .line 347
    iget-object v3, p0, Lz1/L2;->a:Landroid/content/Context;

    .line 348
    .line 349
    invoke-direct {v1, p1, v3}, Lz1/L2$b;-><init>(Lcom/android/launcher3/D3;Landroid/content/Context;)V

    .line 350
    .line 351
    .line 352
    iget-object v3, p0, Lz1/L2;->k:Lcom/android/launcher3/util/K;

    .line 353
    .line 354
    iget-object v4, p0, Lz1/L2;->h:Ls1/V;

    .line 355
    .line 356
    invoke-virtual {v2}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 357
    .line 358
    .line 359
    move-result-object v2

    .line 360
    invoke-virtual {v4, v1, v2}, Ls1/T;->u(Ls1/T$a;Landroid/os/Handler;)Lcom/android/launcher3/util/a2;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    invoke-virtual {v3, v1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 365
    .line 366
    .line 367
    iget-object v1, p0, Lz1/L2;->k:Lcom/android/launcher3/util/K;

    .line 368
    .line 369
    iget-object v2, p0, Lz1/L2;->j:LD1/b;

    .line 370
    .line 371
    invoke-virtual {v2, v0}, LD1/b;->i(LD1/e$a;)LD1/e;

    .line 372
    .line 373
    .line 374
    move-result-object v0

    .line 375
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 376
    .line 377
    .line 378
    new-instance v0, LS1/c;

    .line 379
    .line 380
    iget-object v1, p0, Lz1/L2;->a:Landroid/content/Context;

    .line 381
    .line 382
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 383
    .line 384
    .line 385
    move-result-object v1

    .line 386
    invoke-direct {v0, v1}, LS1/c;-><init>(Landroid/content/Context;)V

    .line 387
    .line 388
    .line 389
    invoke-virtual {p0, v0}, Lz1/L2;->V(LS1/a;)V

    .line 390
    .line 391
    .line 392
    iget-object v0, p0, Lz1/L2;->k:Lcom/android/launcher3/util/K;

    .line 393
    .line 394
    new-instance v1, Lz1/J2;

    .line 395
    .line 396
    invoke-direct {v1, p0}, Lz1/J2;-><init>(Lz1/L2;)V

    .line 397
    .line 398
    .line 399
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 400
    .line 401
    .line 402
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->q0()V

    .line 403
    .line 404
    .line 405
    new-instance v0, Lz1/K2;

    .line 406
    .line 407
    invoke-direct {v0, p1}, Lz1/K2;-><init>(Lcom/android/launcher3/D3;)V

    .line 408
    .line 409
    .line 410
    iget-object v1, p0, Lz1/L2;->g:Lcom/android/launcher3/util/p2;

    .line 411
    .line 412
    sget-object v2, LR0/k;->f:LR0/k$a;

    .line 413
    .line 414
    invoke-virtual {v2}, LR0/k$a;->a()Landroid/net/Uri;

    .line 415
    .line 416
    .line 417
    move-result-object v2

    .line 418
    invoke-virtual {v1, v2, v0}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 419
    .line 420
    .line 421
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->p1()V

    .line 422
    .line 423
    .line 424
    iget-object v1, p0, Lz1/L2;->k:Lcom/android/launcher3/util/K;

    .line 425
    .line 426
    new-instance v2, Lz1/o2;

    .line 427
    .line 428
    invoke-direct {v2, p0, v0}, Lz1/o2;-><init>(Lz1/L2;Lcom/android/launcher3/util/p2$a;)V

    .line 429
    .line 430
    .line 431
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 432
    .line 433
    .line 434
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->G()Z

    .line 435
    .line 436
    .line 437
    move-result v0

    .line 438
    if-eqz v0, :cond_3

    .line 439
    .line 440
    new-instance v0, Lz1/q2;

    .line 441
    .line 442
    invoke-direct {v0, p0}, Lz1/q2;-><init>(Lz1/L2;)V

    .line 443
    .line 444
    .line 445
    iget-object v1, p0, Lz1/L2;->g:Lcom/android/launcher3/util/p2;

    .line 446
    .line 447
    sget-object v2, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->d:Landroid/net/Uri;

    .line 448
    .line 449
    invoke-virtual {v1, v2, v0}, Lcom/android/launcher3/util/p2;->n(Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V

    .line 450
    .line 451
    .line 452
    iget-object v1, p0, Lz1/L2;->k:Lcom/android/launcher3/util/K;

    .line 453
    .line 454
    new-instance v2, Lz1/r2;

    .line 455
    .line 456
    invoke-direct {v2, p0, v0}, Lz1/r2;-><init>(Lz1/L2;Lcom/android/launcher3/util/p2$b;)V

    .line 457
    .line 458
    .line 459
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 460
    .line 461
    .line 462
    :cond_3
    invoke-static {}, Lx1/O;->U3()Z

    .line 463
    .line 464
    .line 465
    move-result v0

    .line 466
    if-eqz v0, :cond_4

    .line 467
    .line 468
    new-instance v0, Lz1/s2;

    .line 469
    .line 470
    invoke-direct {v0, p1}, Lz1/s2;-><init>(Lcom/android/launcher3/D3;)V

    .line 471
    .line 472
    .line 473
    iget-object v1, p0, Lz1/L2;->g:Lcom/android/launcher3/util/p2;

    .line 474
    .line 475
    sget-object v2, Lcom/android/launcher3/util/p2;->o:Landroid/net/Uri;

    .line 476
    .line 477
    invoke-virtual {v1, v2, v0}, Lcom/android/launcher3/util/p2;->n(Landroid/net/Uri;Lcom/android/launcher3/util/p2$b;)V

    .line 478
    .line 479
    .line 480
    iget-object v1, p0, Lz1/L2;->g:Lcom/android/launcher3/util/p2;

    .line 481
    .line 482
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p2;->h(Landroid/net/Uri;)Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object v1

    .line 486
    const-string v2, "getValueString(...)"

    .line 487
    .line 488
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 489
    .line 490
    .line 491
    invoke-virtual {p1, v1}, Lcom/android/launcher3/D3;->k1(Ljava/lang/String;)V

    .line 492
    .line 493
    .line 494
    iget-object p1, p0, Lz1/L2;->k:Lcom/android/launcher3/util/K;

    .line 495
    .line 496
    new-instance v1, Lz1/t2;

    .line 497
    .line 498
    invoke-direct {v1, p0, v0}, Lz1/t2;-><init>(Lz1/L2;Lcom/android/launcher3/util/p2$b;)V

    .line 499
    .line 500
    .line 501
    invoke-virtual {p1, v1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 502
    .line 503
    .line 504
    :cond_4
    return-void
.end method
