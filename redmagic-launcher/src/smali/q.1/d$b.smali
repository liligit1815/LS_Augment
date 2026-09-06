.class Lq/d$b;
.super Lq/b;
.source "LinearSystem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lq/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "b"
.end annotation


# direct methods
.method constructor <init>(Lq/c;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lq/b;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lq/j;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lq/j;-><init>(Lq/b;Lq/c;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lq/b;->e:Lq/b$a;

    .line 10
    .line 11
    return-void
.end method
