.class Lcom/android/launcher3/X0$a;
.super Lrx/h;
.source "IconAnimUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/X0;->O(Landroid/content/Context;Ld1/d;Lcom/android/launcher3/model/data/I;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/h<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic g:Landroid/content/Context;

.field final synthetic h:Ld1/d;

.field final synthetic i:Lcom/android/launcher3/model/data/I;

.field final synthetic j:Lcom/android/launcher3/X0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/X0;Landroid/content/Context;Ld1/d;Lcom/android/launcher3/model/data/I;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/X0$a;->j:Lcom/android/launcher3/X0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/X0$a;->g:Landroid/content/Context;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/X0$a;->h:Ld1/d;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/X0$a;->i:Lcom/android/launcher3/model/data/I;

    .line 8
    .line 9
    invoke-direct {p0}, Lrx/h;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/X0$a;->j:Lcom/android/launcher3/X0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/X0$a;->g:Landroid/content/Context;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/X0$a;->h:Ld1/d;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/X0$a;->i:Lcom/android/launcher3/model/data/I;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p1, p0}, Lcom/android/launcher3/X0;->m(Lcom/android/launcher3/X0;Landroid/content/Context;Ld1/d;Landroid/graphics/Bitmap;Lcom/android/launcher3/model/data/I;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    const-string p0, "IconAnimUtils"

    .line 2
    .line 3
    const-string v0, "startIconAnim, onCompleted!"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "startIconAnim, onError! e="

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "IconAnimUtils"

    .line 26
    .line 27
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/X0$a;->a(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
