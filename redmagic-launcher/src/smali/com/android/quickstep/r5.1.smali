.class public final synthetic Lcom/android/quickstep/r5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic a:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/r5;->a:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/quickstep/r5;->b:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/r5;->a:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/android/quickstep/r5;->b:Z

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/quickstep/TaskThumbnailCache;->b(Lcom/android/systemui/shared/recents/model/Task$TaskKey;Z)Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
