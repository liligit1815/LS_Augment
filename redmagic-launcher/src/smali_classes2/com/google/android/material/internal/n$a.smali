.class Lcom/google/android/material/internal/n$a;
.super Ln3/f;
.source "TextDrawableHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/internal/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/google/android/material/internal/n;


# direct methods
.method constructor <init>(Lcom/google/android/material/internal/n;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/internal/n$a;->a:Lcom/google/android/material/internal/n;

    .line 2
    .line 3
    invoke-direct {p0}, Ln3/f;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/google/android/material/internal/n$a;->a:Lcom/google/android/material/internal/n;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Lcom/google/android/material/internal/n;->a(Lcom/google/android/material/internal/n;Z)Z

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/google/android/material/internal/n$a;->a:Lcom/google/android/material/internal/n;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/google/android/material/internal/n;->b(Lcom/google/android/material/internal/n;)Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/google/android/material/internal/n$b;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0}, Lcom/google/android/material/internal/n$b;->a()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public b(Landroid/graphics/Typeface;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/google/android/material/internal/n$a;->a:Lcom/google/android/material/internal/n;

    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    invoke-static {p1, p2}, Lcom/google/android/material/internal/n;->a(Lcom/google/android/material/internal/n;Z)Z

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/google/android/material/internal/n$a;->a:Lcom/google/android/material/internal/n;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/google/android/material/internal/n;->b(Lcom/google/android/material/internal/n;)Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/google/android/material/internal/n$b;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-interface {p0}, Lcom/google/android/material/internal/n$b;->a()V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method
