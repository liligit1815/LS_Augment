.class public abstract Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;
.super Ljava/lang/Object;
.source "TaskThumbnailUiState.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Snapshot"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithHeader;,
        Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot$WithoutHeader;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/task/thumbnail/TaskThumbnailUiState$Snapshot;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getBackgroundColor()I
.end method

.method public abstract getBitmap()Landroid/graphics/Bitmap;
.end method

.method public abstract getThumbnailRotation()I
.end method
