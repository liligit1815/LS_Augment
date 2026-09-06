.class public LC0/l;
.super Ljava/lang/Object;
.source "Repeater.java"

# interfaces
.implements LC0/c;


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:LB0/b;

.field private final c:LB0/b;

.field private final d:LB0/l;

.field private final e:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;LB0/b;LB0/b;LB0/l;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LC0/l;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, LC0/l;->b:LB0/b;

    .line 7
    .line 8
    iput-object p3, p0, LC0/l;->c:LB0/b;

    .line 9
    .line 10
    iput-object p4, p0, LC0/l;->d:LB0/l;

    .line 11
    .line 12
    iput-boolean p5, p0, LC0/l;->e:Z

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Lcom/airbnb/lottie/n;Lv0/h;LD0/b;)Lx0/c;
    .locals 0

    .line 1
    new-instance p2, Lx0/p;

    .line 2
    .line 3
    invoke-direct {p2, p1, p3, p0}, Lx0/p;-><init>(Lcom/airbnb/lottie/n;LD0/b;LC0/l;)V

    .line 4
    .line 5
    .line 6
    return-object p2
.end method

.method public b()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/l;->b:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/l;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()LB0/b;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/l;->c:LB0/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()LB0/l;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/l;->d:LB0/l;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LC0/l;->e:Z

    .line 2
    .line 3
    return p0
.end method
