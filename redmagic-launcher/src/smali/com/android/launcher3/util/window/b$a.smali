.class public final Lcom/android/launcher3/util/window/b$a;
.super Ljava/lang/Object;
.source "RefreshRateTracker.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/util/window/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field static final synthetic a:Lcom/android/launcher3/util/window/b$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/window/b$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/util/window/b$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/util/window/b$a;->a:Lcom/android/launcher3/util/window/b$a;

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
.method public final a(Landroid/content/Context;)I
    .locals 0

    .line 1
    const-string p0, "<this>"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lg1/e;->a:Lg1/e;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lg1/e;->b(Landroid/content/Context;)Lg1/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Lcom/android/quickstep/dagger/QuickstepBaseAppComponent;->getFrameRateProvider()Lcom/android/launcher3/util/window/b;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Lcom/android/launcher3/util/window/b;->getSingleFrameMs()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method
