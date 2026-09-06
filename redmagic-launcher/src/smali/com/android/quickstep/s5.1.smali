.class public final synthetic Lcom/android/quickstep/s5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/quickstep/TaskThumbnailCache;

.field public final synthetic b:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

.field public final synthetic c:Ljava/util/function/Consumer;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/TaskThumbnailCache;Lcom/android/systemui/shared/recents/model/Task$TaskKey;Ljava/util/function/Consumer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/s5;->a:Lcom/android/quickstep/TaskThumbnailCache;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/s5;->b:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/s5;->c:Ljava/util/function/Consumer;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/s5;->a:Lcom/android/quickstep/TaskThumbnailCache;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/s5;->b:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/s5;->c:Ljava/util/function/Consumer;

    .line 6
    .line 7
    check-cast p1, Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/quickstep/TaskThumbnailCache;->a(Lcom/android/quickstep/TaskThumbnailCache;Lcom/android/systemui/shared/recents/model/Task$TaskKey;Ljava/util/function/Consumer;Lcom/android/systemui/shared/recents/model/ThumbnailData;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
