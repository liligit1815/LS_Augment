.class public Lcom/android/launcher3/cloudfolder/RemoteView$b;
.super Ljava/lang/Object;
.source "RemoteView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/cloudfolder/RemoteView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "b"
.end annotation


# instance fields
.field private a:Landroid/os/Bundle;

.field private b:Landroid/os/Bundle;

.field protected c:Lcom/android/launcher3/cloudfolder/RemoteView$d;

.field protected d:Landroid/view/View;

.field protected e:Lcom/android/launcher3/cloudfolder/RemoteView$j;

.field protected f:Lcom/android/launcher3/cloudfolder/RemoteView$f;

.field protected g:Lcom/android/launcher3/cloudfolder/RemoteView$f;

.field private h:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/os/Bundle;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Lcom/android/launcher3/cloudfolder/RemoteView$f;-><init>(Ld1/h;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$b;->f:Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/android/launcher3/cloudfolder/RemoteView$f;-><init>(Ld1/h;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$b;->g:Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 18
    .line 19
    new-instance v0, Landroid/util/SparseArray;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$b;->h:Landroid/util/SparseArray;

    .line 25
    .line 26
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/cloudfolder/RemoteView$b;)Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$b;->b:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/cloudfolder/RemoteView$b;)Landroid/util/SparseArray;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$b;->h:Landroid/util/SparseArray;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/cloudfolder/RemoteView$b;)Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$b;->a:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/cloudfolder/RemoteView$b;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$b;->b:Landroid/os/Bundle;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic e(Lcom/android/launcher3/cloudfolder/RemoteView$b;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$b;->a:Landroid/os/Bundle;

    .line 2
    .line 3
    return-void
.end method
