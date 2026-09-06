.class public final Lcom/android/quickstep/fallback/window/RecentsDisplayModel;
.super Lcom/android/quickstep/DisplayModel;
.source "RecentsDisplayModel.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/fallback/window/RecentsDisplayModel$Companion;,
        Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/quickstep/DisplayModel<",
        "Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;",
        ">;"
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/fallback/window/RecentsDisplayModel$Companion;

.field private static final DEBUG:Z = false

.field private static final INSTANCE:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/quickstep/fallback/window/RecentsDisplayModel;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "RecentsDisplayModel"


# instance fields
.field private final wallpaperColorHints:Lcom/android/launcher3/util/h3;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->Companion:Lcom/android/quickstep/fallback/window/RecentsDisplayModel$Companion;

    .line 8
    .line 9
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    new-instance v1, Lcom/android/quickstep/fallback/window/a;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/android/quickstep/fallback/window/a;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/h3;Lcom/android/launcher3/util/K;)V
    .locals 1

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "wallpaperColorHints"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "tracker"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/android/quickstep/DisplayModel;-><init>(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    iput-object p2, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->wallpaperColorHints:Lcom/android/launcher3/util/h3;

    .line 20
    .line 21
    sget-object p1, Lcom/android/quickstep/fallback/window/RecentsWindowFlags;->Companion:Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/android/quickstep/fallback/window/RecentsWindowFlags$Companion;->getEnableOverviewInWindow()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/quickstep/DisplayModel;->initializeDisplays()V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p1, 0x0

    .line 34
    invoke-virtual {p0, p1}, Lcom/android/quickstep/DisplayModel;->storeDisplayResource(I)V

    .line 35
    .line 36
    .line 37
    :goto_0
    new-instance p1, Lcom/android/quickstep/fallback/window/b;

    .line 38
    .line 39
    invoke-direct {p1, p0}, Lcom/android/quickstep/fallback/window/b;-><init>(Lcom/android/quickstep/fallback/window/RecentsDisplayModel;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p3, p1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method private static final _init_$lambda$0(Lcom/android/quickstep/fallback/window/RecentsDisplayModel;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/DisplayModel;->destroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/fallback/window/RecentsDisplayModel;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->_init_$lambda$0(Lcom/android/quickstep/fallback/window/RecentsDisplayModel;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getDisplayResourceArray(Lcom/android/quickstep/fallback/window/RecentsDisplayModel;)Landroid/util/SparseArray;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/DisplayModel;->getDisplayResourceArray()Landroid/util/SparseArray;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic access$getINSTANCE$cp()Lcom/android/launcher3/util/I;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final getINSTANCE()Lcom/android/launcher3/util/I;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/quickstep/fallback/window/RecentsDisplayModel;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->Companion:Lcom/android/quickstep/fallback/window/RecentsDisplayModel$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$Companion;->getINSTANCE()Lcom/android/launcher3/util/I;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method


# virtual methods
.method public bridge synthetic createDisplayResource(Landroid/view/Display;)Lcom/android/quickstep/DisplayModel$DisplayResource;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->createDisplayResource(Landroid/view/Display;)Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;

    move-result-object p0

    return-object p0
.end method

.method protected createDisplayResource(Landroid/view/Display;)Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;
    .locals 3

    const-string v0, "display"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 2
    new-instance v0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;

    .line 3
    invoke-virtual {p1}, Landroid/view/Display;->getDisplayId()I

    move-result v1

    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/DisplayModel;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/Context;->createDisplayContext(Landroid/view/Display;)Landroid/content/Context;

    move-result-object p1

    const-string v2, "createDisplayContext(...)"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    iget-object p0, p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel;->wallpaperColorHints:Lcom/android/launcher3/util/h3;

    invoke-virtual {p0}, Lcom/android/launcher3/util/h3;->i()I

    move-result p0

    .line 6
    invoke-direct {v0, v1, p1, p0}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;-><init>(ILandroid/content/Context;I)V

    return-object v0
.end method

.method public final getActiveDisplayResources()Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable<",
            "Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$activeDisplayResources$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$activeDisplayResources$1;-><init>(Lcom/android/quickstep/fallback/window/RecentsDisplayModel;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final getFallbackWindowInterface(I)Lcom/android/quickstep/FallbackWindowInterface;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/DisplayModel;->getDisplayResource(I)Lcom/android/quickstep/DisplayModel$DisplayResource;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->getFallbackWindowInterface()Lcom/android/quickstep/FallbackWindowInterface;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public final getRecentsWindowManager(I)Lcom/android/quickstep/fallback/window/RecentsWindowManager;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/DisplayModel;->getDisplayResource(I)Lcom/android/quickstep/DisplayModel$DisplayResource;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->getRecentsWindowManager()Lcom/android/quickstep/fallback/window/RecentsWindowManager;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public final getTaskAnimationManager(I)Lcom/android/quickstep/TaskAnimationManager;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/DisplayModel;->getDisplayResource(I)Lcom/android/quickstep/DisplayModel$DisplayResource;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/quickstep/fallback/window/RecentsDisplayModel$RecentsDisplayResource;->getTaskAnimationManager()Lcom/android/quickstep/TaskAnimationManager;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method
