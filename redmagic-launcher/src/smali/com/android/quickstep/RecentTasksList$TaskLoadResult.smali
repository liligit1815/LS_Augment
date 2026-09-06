.class Lcom/android/quickstep/RecentTasksList$TaskLoadResult;
.super Ljava/util/ArrayList;
.source "RecentTasksList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/RecentTasksList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TaskLoadResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList<",
        "Lcom/android/quickstep/util/GroupTask;",
        ">;"
    }
.end annotation


# instance fields
.field final mKeysOnly:Z

.field final mRequestId:I


# direct methods
.method constructor <init>(IZI)V
    .locals 0

    .line 1
    invoke-direct {p0, p3}, Ljava/util/ArrayList;-><init>(I)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/quickstep/RecentTasksList$TaskLoadResult;->mRequestId:I

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/quickstep/RecentTasksList$TaskLoadResult;->mKeysOnly:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method isValidForRequest(IZ)Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/RecentTasksList$TaskLoadResult;->mRequestId:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_1

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/android/quickstep/RecentTasksList$TaskLoadResult;->mKeysOnly:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    :cond_0
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_1
    const/4 p0, 0x0

    .line 14
    return p0
.end method
