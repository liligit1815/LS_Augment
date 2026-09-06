.class final Lb5/d$a;
.super Ljava/lang/Object;
.source "SerialSubscription.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb5/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation


# instance fields
.field final a:Z

.field final b:Lrx/i;


# direct methods
.method constructor <init>(ZLrx/i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lb5/d$a;->a:Z

    .line 5
    .line 6
    iput-object p2, p0, Lb5/d$a;->b:Lrx/i;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method a(Lrx/i;)Lb5/d$a;
    .locals 1

    .line 1
    new-instance v0, Lb5/d$a;

    .line 2
    .line 3
    iget-boolean p0, p0, Lb5/d$a;->a:Z

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Lb5/d$a;-><init>(ZLrx/i;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method b()Lb5/d$a;
    .locals 2

    .line 1
    new-instance v0, Lb5/d$a;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iget-object p0, p0, Lb5/d$a;->b:Lrx/i;

    .line 5
    .line 6
    invoke-direct {v0, v1, p0}, Lb5/d$a;-><init>(ZLrx/i;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method
