.class final Lx0/a$b;
.super Ljava/lang/Object;
.source "BaseStrokeContent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lx0/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "b"
.end annotation


# instance fields
.field private final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lx0/m;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Lx0/u;


# direct methods
.method private constructor <init>(Lx0/u;)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lx0/a$b;->a:Ljava/util/List;

    .line 4
    iput-object p1, p0, Lx0/a$b;->b:Lx0/u;

    return-void
.end method

.method synthetic constructor <init>(Lx0/u;Lx0/a$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lx0/a$b;-><init>(Lx0/u;)V

    return-void
.end method

.method static synthetic a(Lx0/a$b;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lx0/a$b;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic b(Lx0/a$b;)Lx0/u;
    .locals 0

    .line 1
    iget-object p0, p0, Lx0/a$b;->b:Lx0/u;

    .line 2
    .line 3
    return-object p0
.end method
