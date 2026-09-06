.class public LC0/m;
.super Ljava/lang/Object;
.source "RoundedCorners.java"

# interfaces
.implements LC0/c;


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:LB0/m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LB0/m<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;LB0/m;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "LB0/m<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LC0/m;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, LC0/m;->b:LB0/m;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/airbnb/lottie/n;Lv0/h;LD0/b;)Lx0/c;
    .locals 0

    .line 1
    new-instance p2, Lx0/q;

    .line 2
    .line 3
    invoke-direct {p2, p1, p3, p0}, Lx0/q;-><init>(Lcom/airbnb/lottie/n;LD0/b;LC0/m;)V

    .line 4
    .line 5
    .line 6
    return-object p2
.end method

.method public b()LB0/m;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LB0/m<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LC0/m;->b:LB0/m;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/m;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
