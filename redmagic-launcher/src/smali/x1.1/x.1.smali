.class public Lx1/x;
.super Ljava/lang/Object;
.source "DBMRunnable.java"


# instance fields
.field private a:Ljava/lang/Runnable;

.field private b:Z


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lx1/x;->a:Ljava/lang/Runnable;

    .line 5
    .line 6
    iput-boolean p2, p0, Lx1/x;->b:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lx1/x;->a:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lx1/x;->b:Z

    .line 2
    .line 3
    return p0
.end method
