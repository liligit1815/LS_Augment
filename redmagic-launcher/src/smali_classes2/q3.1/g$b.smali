.class Lq3/g$b;
.super Ljava/lang/Object;
.source "MaterialShapeDrawable.java"

# interfaces
.implements Lq3/k$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lq3/g;->i()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:F

.field final synthetic b:Lq3/g;


# direct methods
.method constructor <init>(Lq3/g;F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lq3/g$b;->b:Lq3/g;

    .line 2
    .line 3
    iput p2, p0, Lq3/g$b;->a:F

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lq3/c;)Lq3/c;
    .locals 1

    .line 1
    instance-of v0, p1, Lq3/i;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object p1

    .line 6
    :cond_0
    new-instance v0, Lq3/b;

    .line 7
    .line 8
    iget p0, p0, Lq3/g$b;->a:F

    .line 9
    .line 10
    invoke-direct {v0, p0, p1}, Lq3/b;-><init>(FLq3/c;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method
