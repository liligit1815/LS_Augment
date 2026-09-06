.class public LC0/h;
.super Ljava/lang/Object;
.source "Mask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LC0/h$a;
    }
.end annotation


# instance fields
.field private final a:LC0/h$a;

.field private final b:LB0/h;

.field private final c:LB0/d;

.field private final d:Z


# direct methods
.method public constructor <init>(LC0/h$a;LB0/h;LB0/d;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LC0/h;->a:LC0/h$a;

    .line 5
    .line 6
    iput-object p2, p0, LC0/h;->b:LB0/h;

    .line 7
    .line 8
    iput-object p3, p0, LC0/h;->c:LB0/d;

    .line 9
    .line 10
    iput-boolean p4, p0, LC0/h;->d:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()LC0/h$a;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/h;->a:LC0/h$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()LB0/h;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/h;->b:LB0/h;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()LB0/d;
    .locals 0

    .line 1
    iget-object p0, p0, LC0/h;->c:LB0/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LC0/h;->d:Z

    .line 2
    .line 3
    return p0
.end method
