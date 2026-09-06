.class public final Landroidx/activity/p$g;
.super Ljava/lang/Object;
.source "OnBackPressedDispatcher.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/activity/p;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "g"
.end annotation


# static fields
.field public static final a:Landroidx/activity/p$g;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroidx/activity/p$g;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/activity/p$g;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Landroidx/activity/p$g;->a:Landroidx/activity/p$g;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Lu4/l;Lu4/l;Lu4/a;Lu4/a;)Landroid/window/OnBackInvokedCallback;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/l<",
            "-",
            "Landroidx/activity/b;",
            "Lh4/t;",
            ">;",
            "Lu4/l<",
            "-",
            "Landroidx/activity/b;",
            "Lh4/t;",
            ">;",
            "Lu4/a<",
            "Lh4/t;",
            ">;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)",
            "Landroid/window/OnBackInvokedCallback;"
        }
    .end annotation

    .line 1
    const-string p0, "onBackStarted"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "onBackProgressed"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "onBackInvoked"

    .line 12
    .line 13
    invoke-static {p3, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "onBackCancelled"

    .line 17
    .line 18
    invoke-static {p4, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance p0, Landroidx/activity/p$g$a;

    .line 22
    .line 23
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/activity/p$g$a;-><init>(Lu4/l;Lu4/l;Lu4/a;Lu4/a;)V

    .line 24
    .line 25
    .line 26
    return-object p0
.end method
