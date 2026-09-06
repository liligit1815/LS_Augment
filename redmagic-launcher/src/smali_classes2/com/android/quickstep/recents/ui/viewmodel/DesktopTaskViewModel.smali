.class public final Lcom/android/quickstep/recents/ui/viewmodel/DesktopTaskViewModel;
.super Ljava/lang/Object;
.source "DesktopTaskViewModel.kt"


# instance fields
.field private final organizeDesktopTasksUseCase:Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;

.field private organizedDesktopTaskPositions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;)V
    .locals 1

    .line 1
    const-string v0, "organizeDesktopTasksUseCase"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/DesktopTaskViewModel;->organizeDesktopTasksUseCase:Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;

    .line 10
    .line 11
    invoke-static {}, Li4/m;->k()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/DesktopTaskViewModel;->organizedDesktopTaskPositions:Ljava/util/List;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final getOrganizedDesktopTaskPositions()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/recents/ui/viewmodel/DesktopTaskViewModel;->organizedDesktopTaskPositions:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final organizeDesktopTasks(Landroid/util/Size;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Size;",
            "Ljava/util/List<",
            "Lcom/android/quickstep/recents/domain/model/DesktopTaskBoundsData;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "desktopSize"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "defaultPositions"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/quickstep/recents/ui/viewmodel/DesktopTaskViewModel;->organizeDesktopTasksUseCase:Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;

    .line 12
    .line 13
    new-instance v1, Landroid/graphics/Rect;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-direct {v1, v3, v3, v2, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1, p2}, Lcom/android/quickstep/recents/domain/usecase/OrganizeDesktopTasksUseCase;->run(Landroid/graphics/Rect;Ljava/util/List;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/android/quickstep/recents/ui/viewmodel/DesktopTaskViewModel;->organizedDesktopTaskPositions:Ljava/util/List;

    .line 32
    .line 33
    return-void
.end method
