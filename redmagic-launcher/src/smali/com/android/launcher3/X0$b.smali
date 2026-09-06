.class Lcom/android/launcher3/X0$b;
.super Ljava/lang/Object;
.source "IconAnimUtils.java"

# interfaces
.implements Lrx/b$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/X0;->w(Landroid/content/Context;Ld1/d;)Lrx/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/b$a<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Ld1/d;

.field final synthetic b:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/android/launcher3/X0;Ld1/d;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/X0$b;->a:Ld1/d;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/launcher3/X0$b;->b:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lrx/h;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/h<",
            "-",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/X0$b;->a:Ld1/d;

    .line 2
    .line 3
    iget-object v0, v0, Ld1/d;->h:Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    invoke-static {v0}, Lx1/O;->G(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/android/launcher3/X0$b;->b:Landroid/content/Context;

    .line 10
    .line 11
    const-string v2, "IconAnimation"

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object p0, p0, Lcom/android/launcher3/X0$b;->a:Ld1/d;

    .line 23
    .line 24
    iget-object v2, p0, Ld1/d;->c:Ljava/lang/String;

    .line 25
    .line 26
    iget-object p0, p0, Ld1/d;->b:Ljava/lang/String;

    .line 27
    .line 28
    invoke-interface {v1, v2, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 29
    .line 30
    .line 31
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1, v0}, Lrx/c;->onNext(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {p1}, Lrx/c;->onCompleted()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :catch_0
    move-exception p0

    .line 42
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 43
    .line 44
    .line 45
    invoke-interface {p1, p0}, Lrx/c;->onError(Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lrx/h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/X0$b;->a(Lrx/h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
