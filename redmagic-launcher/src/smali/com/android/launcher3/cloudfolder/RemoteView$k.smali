.class public Lcom/android/launcher3/cloudfolder/RemoteView$k;
.super Ljava/lang/Object;
.source "RemoteView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/cloudfolder/RemoteView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "k"
.end annotation


# instance fields
.field public a:Lcom/android/launcher3/cloudfolder/RemoteView$j;

.field public b:Lcom/android/launcher3/cloudfolder/RemoteView$j;

.field public c:Lcom/android/launcher3/cloudfolder/RemoteView$j;

.field public d:Lcom/android/launcher3/cloudfolder/RemoteView$j;

.field public e:Lcom/android/launcher3/cloudfolder/RemoteView$j;


# direct methods
.method protected constructor <init>(Lcom/android/launcher3/cloudfolder/RemoteView$j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$k;->a:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 5
    .line 6
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/cloudfolder/RemoteView$k;Lcom/android/launcher3/cloudfolder/RemoteView$k;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$k;->b(Lcom/android/launcher3/cloudfolder/RemoteView$k;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private b(Lcom/android/launcher3/cloudfolder/RemoteView$k;)Z
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p1, Lcom/android/launcher3/cloudfolder/RemoteView$k;->a:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$k;->a:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lcom/android/launcher3/cloudfolder/RemoteView$k;->b:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$k;->b:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p1, Lcom/android/launcher3/cloudfolder/RemoteView$k;->c:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$k;->c:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 18
    .line 19
    if-ne v0, v1, :cond_0

    .line 20
    .line 21
    iget-object v0, p1, Lcom/android/launcher3/cloudfolder/RemoteView$k;->d:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$k;->d:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 24
    .line 25
    if-ne v0, v1, :cond_0

    .line 26
    .line 27
    iget-object p1, p1, Lcom/android/launcher3/cloudfolder/RemoteView$k;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$k;->e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 30
    .line 31
    if-ne p1, p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method
