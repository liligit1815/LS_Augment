.class Lcom/google/android/material/internal/s$a;
.super Ljava/lang/Object;
.source "ViewUtils.java"

# interfaces
.implements LJ/x;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/internal/s;->b(Landroid/view/View;Lcom/google/android/material/internal/s$c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/google/android/material/internal/s$c;

.field final synthetic b:Lcom/google/android/material/internal/s$d;


# direct methods
.method constructor <init>(Lcom/google/android/material/internal/s$c;Lcom/google/android/material/internal/s$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/internal/s$a;->a:Lcom/google/android/material/internal/s$c;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/google/android/material/internal/s$a;->b:Lcom/google/android/material/internal/s$d;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;LJ/Y;)LJ/Y;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/internal/s$a;->a:Lcom/google/android/material/internal/s$c;

    .line 2
    .line 3
    new-instance v1, Lcom/google/android/material/internal/s$d;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/material/internal/s$a;->b:Lcom/google/android/material/internal/s$d;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/google/android/material/internal/s$d;-><init>(Lcom/google/android/material/internal/s$d;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, p1, p2, v1}, Lcom/google/android/material/internal/s$c;->a(Landroid/view/View;LJ/Y;Lcom/google/android/material/internal/s$d;)LJ/Y;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method
