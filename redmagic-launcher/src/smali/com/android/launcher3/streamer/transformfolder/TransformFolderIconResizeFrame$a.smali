.class Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame$a;
.super Ljava/lang/Object;
.source "TransformFolderIconResizeFrame.java"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field private final g:Landroid/graphics/Point;

.field private final h:Landroid/graphics/Point;


# direct methods
.method constructor <init>(Landroid/graphics/Point;Landroid/graphics/Point;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame$a;->g:Landroid/graphics/Point;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame$a;->h:Landroid/graphics/Point;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b()Landroid/graphics/Point;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame$a;->g:Landroid/graphics/Point;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Landroid/graphics/Point;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconResizeFrame$a;->h:Landroid/graphics/Point;

    .line 2
    .line 3
    return-object p0
.end method

.method public close()V
    .locals 0

    .line 1
    return-void
.end method
