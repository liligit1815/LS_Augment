.class public final synthetic Lcom/android/quickstep/recents/data/f;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/l;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/systemui/shared/recents/model/ThumbnailData;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/quickstep/recents/data/TasksRepository;->b(Lcom/android/systemui/shared/recents/model/ThumbnailData;)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
