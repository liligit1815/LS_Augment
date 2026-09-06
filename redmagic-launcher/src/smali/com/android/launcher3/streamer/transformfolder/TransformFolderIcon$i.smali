.class Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$i;
.super Ljava/lang/Object;
.source "TransformFolderIcon.java"

# interfaces
.implements Lcom/android/launcher3/L4;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;


# direct methods
.method constructor <init>(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$i;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/c;)V
    .locals 2

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "ReorderAlarmListener: reorder folder, empty rank: "

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$i;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->D0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v0, ", target rank: "

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$i;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->E0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string v0, "TransformFolderIcon"

    .line 39
    .line 40
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$i;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 44
    .line 45
    invoke-static {p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->D0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget-object v1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$i;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 50
    .line 51
    invoke-static {v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->E0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-virtual {p1, v0, v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->s1(II)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon$i;->g:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 59
    .line 60
    invoke-static {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->E0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;)I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    invoke-static {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->G0(Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;I)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
