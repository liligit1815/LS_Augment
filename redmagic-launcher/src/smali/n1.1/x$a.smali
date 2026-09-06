.class Ln1/x$a;
.super Ljava/lang/Object;
.source "SysUiScrim.java"

# interfaces
.implements Lcom/android/launcher3/util/h2$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ln1/x;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ln1/x;


# direct methods
.method constructor <init>(Ln1/x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ln1/x$a;->a:Ln1/x;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ln1/x$a;->a:Ln1/x;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-static {p0, p1}, Ln1/x;->b(Ln1/x;Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object p0, p0, Ln1/x$a;->a:Ln1/x;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ln1/x;->b(Ln1/x;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
