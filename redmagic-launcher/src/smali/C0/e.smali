.class public LC0/e;
.super Ljava/lang/Object;
.source "GradientFill.java"

# interfaces
.implements LC0/c;


# instance fields
.field private final a:LC0/g;

.field private final b:Landroid/graphics/Path$FillType;

.field private final c:LB0/c;

.field private final d:LB0/d;

.field private final e:LB0/f;

.field private final f:LB0/f;

.field private final g:Ljava/lang/String;

.field private final h:LB0/b;

.field private final i:LB0/b;

.field private final j:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;LC0/g;Landroid/graphics/Path$FillType;LB0/c;LB0/d;LB0/f;LB0/f;LB0/b;LB0/b;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, LC0/e;->a:LC0/g;

    .line 5
    .line 6
    iput-object p3, p0, LC0/e;->b:Landroid/graphics/Path$FillType;

    .line 7
    .line 8
    iput-object p4, p0, LC0/e;->c:LB0/c;

    .line 9
    .line 10
    iput-object p5, p0, LC0/e;->d:LB0/d;

    .line 11
    .line 12
    iput-object p6, p0, LC0/e;->e:LB0/f;

    .line 13
    .line 14
    iput-object p7, p0, LC0/e;->f:LB0/f;

    .line 15
    .line 16
    iput-object p1, p0, LC0/e;->g:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p8, p0, LC0/e;->h:LB0/b;

    .line 19
    .line 20
    iput-object p9, p0, LC0/e;->i:LB0/b;

    .line 21
    .line 22
    iput-boolean p10, p0, LC0/e;->j:Z

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public a(Lcom/airbnb/lottie/n;Lv0/h;LD0/b;)Lx0/c;
    .locals 1

    .line 1
    new-instance v0, Lx0/h;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3, p0}, Lx0/h;-><init>(Lcom/airbnb/lottie/n;Lv0/h;LD0/b;LC0/e;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public b()LB0/f;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/e;->f:LB0/f;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Landroid/graphics/Path$FillType;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/e;->b:Landroid/graphics/Path$FillType;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()LB0/c;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/e;->c:LB0/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()LC0/g;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/e;->a:LC0/g;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/e;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()LB0/d;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/e;->d:LB0/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()LB0/f;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/e;->e:LB0/f;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LC0/e;->j:Z

    .line 2
    .line 3
    return p0
.end method
