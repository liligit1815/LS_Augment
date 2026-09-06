.class public final Lo0/b$a;
.super Ljava/lang/Object;
.source "ActivityRule.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lo0/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field private final a:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lo0/a;",
            ">;"
        }
    .end annotation
.end field

.field private b:Ljava/lang/String;

.field private c:Z


# direct methods
.method public constructor <init>(Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lo0/a;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "filters"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lo0/b$a;->a:Ljava/util/Set;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a()Lo0/b;
    .locals 3

    .line 1
    new-instance v0, Lo0/b;

    .line 2
    .line 3
    iget-object v1, p0, Lo0/b$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lo0/b$a;->a:Ljava/util/Set;

    .line 6
    .line 7
    iget-boolean p0, p0, Lo0/b$a;->c:Z

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, p0}, Lo0/b;-><init>(Ljava/lang/String;Ljava/util/Set;Z)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public final b(Z)Lo0/b$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lo0/b$a;->c:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(Ljava/lang/String;)Lo0/b$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lo0/b$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
