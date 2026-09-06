.class public abstract Lo0/j;
.super Ljava/lang/Object;
.source "EmbeddingAnimationBackground.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lo0/j$a;,
        Lo0/j$b;,
        Lo0/j$c;
    }
.end annotation


# static fields
.field public static final a:Lo0/j$b;

.field public static final b:Lo0/j;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lo0/j$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lo0/j$b;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lo0/j;->a:Lo0/j$b;

    .line 8
    .line 9
    new-instance v0, Lo0/j$c;

    .line 10
    .line 11
    invoke-direct {v0}, Lo0/j$c;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lo0/j;->b:Lo0/j;

    .line 15
    .line 16
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lo0/j;-><init>()V

    return-void
.end method
