.class public final synthetic Lcom/android/launcher3/taskbar/n;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


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
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    new-instance p0, Lcom/android/quickstep/util/SingleTask;

    .line 2
    .line 3
    check-cast p1, Lcom/android/systemui/shared/recents/model/Task;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/SingleTask;-><init>(Lcom/android/systemui/shared/recents/model/Task;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method
