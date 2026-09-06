.class public final synthetic Lcom/android/quickstep/util/w;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/util/AppPairsController;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:Lcom/android/launcher3/apppairs/AppPairIcon;

.field public final synthetic e:Ljava/util/List;

.field public final synthetic f:Lcom/android/launcher3/taskbar/I1;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/AppPairsController;IILcom/android/launcher3/apppairs/AppPairIcon;Ljava/util/List;Lcom/android/launcher3/taskbar/I1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/w;->a:Lcom/android/quickstep/util/AppPairsController;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/quickstep/util/w;->b:I

    .line 7
    .line 8
    iput p3, p0, Lcom/android/quickstep/util/w;->c:I

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/util/w;->d:Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/quickstep/util/w;->e:Ljava/util/List;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/quickstep/util/w;->f:Lcom/android/launcher3/taskbar/I1;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/w;->a:Lcom/android/quickstep/util/AppPairsController;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/util/w;->b:I

    .line 4
    .line 5
    iget v2, p0, Lcom/android/quickstep/util/w;->c:I

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/util/w;->d:Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/quickstep/util/w;->e:Ljava/util/List;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/quickstep/util/w;->f:Lcom/android/launcher3/taskbar/I1;

    .line 12
    .line 13
    move-object v6, p1

    .line 14
    check-cast v6, [Lcom/android/systemui/shared/recents/model/Task;

    .line 15
    .line 16
    invoke-static/range {v0 .. v6}, Lcom/android/quickstep/util/AppPairsController;->j(Lcom/android/quickstep/util/AppPairsController;IILcom/android/launcher3/apppairs/AppPairIcon;Ljava/util/List;Lcom/android/launcher3/taskbar/I1;[Lcom/android/systemui/shared/recents/model/Task;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
