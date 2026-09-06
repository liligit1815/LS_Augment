.class public abstract Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile;
.super Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;
.source "TaskThumbnailUiState.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "LiveTile"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithHeader;,
        Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile$WithoutHeader;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;-><init>(Lkotlin/jvm/internal/j;)V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$LiveTile;-><init>()V

    return-void
.end method
