.class public final synthetic Lcom/android/quickstep/util/t1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/ToLongFunction;


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
.method public final applyAsLong(Ljava/lang/Object;)J
    .locals 0

    .line 1
    check-cast p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/quickstep/util/TaskKeyByLastActiveTimeCache;->a(Lcom/android/systemui/shared/recents/model/Task$TaskKey;)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method
