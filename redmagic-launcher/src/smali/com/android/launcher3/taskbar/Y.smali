.class public final synthetic Lcom/android/launcher3/taskbar/Y;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Ljava/util/Set;

.field public final synthetic b:Lcom/android/systemui/shared/recents/model/Task;

.field public final synthetic c:Ljava/util/ArrayList;

.field public final synthetic d:Lcom/android/launcher3/taskbar/b0;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Set;Lcom/android/systemui/shared/recents/model/Task;Ljava/util/ArrayList;Lcom/android/launcher3/taskbar/b0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/Y;->a:Ljava/util/Set;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/Y;->b:Lcom/android/systemui/shared/recents/model/Task;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/taskbar/Y;->c:Ljava/util/ArrayList;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/taskbar/Y;->d:Lcom/android/launcher3/taskbar/b0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/Y;->a:Ljava/util/Set;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/Y;->b:Lcom/android/systemui/shared/recents/model/Task;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/taskbar/Y;->c:Ljava/util/ArrayList;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/Y;->d:Lcom/android/launcher3/taskbar/b0;

    .line 8
    .line 9
    check-cast p1, Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, p0, p1}, Lcom/android/launcher3/taskbar/b0;->N(Ljava/util/Set;Lcom/android/systemui/shared/recents/model/Task;Ljava/util/ArrayList;Lcom/android/launcher3/taskbar/b0;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
