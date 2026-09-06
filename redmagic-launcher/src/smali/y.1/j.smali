.class public final Ly/j;
.super Ljava/lang/Object;
.source "FloatEvaluator.java"

# interfaces
.implements Ly/y;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ly/y<",
        "Ljava/lang/Float;",
        ">;"
    }
.end annotation


# static fields
.field private static final a:Ly/j;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ly/j;

    .line 2
    .line 3
    invoke-direct {v0}, Ly/j;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ly/j;->a:Ly/j;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b()Ly/j;
    .locals 1

    .line 1
    sget-object v0, Ly/j;->a:Ly/j;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(FLjava/lang/Float;Ljava/lang/Float;)Ljava/lang/Float;
    .locals 0
    .param p2    # Ljava/lang/Float;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "AutoBoxing"
            }
        .end annotation
    .end param
    .param p3    # Ljava/lang/Float;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "AutoBoxing"
            }
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "AutoBoxing"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    sub-float/2addr p2, p0

    .line 10
    mul-float/2addr p1, p2

    .line 11
    add-float/2addr p0, p1

    .line 12
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public bridge synthetic evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p2    # Ljava/lang/Object;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "AutoBoxing"
            }
        .end annotation
    .end param
    .param p3    # Ljava/lang/Object;
        .annotation build Landroid/annotation/SuppressLint;
            value = {
                "AutoBoxing"
            }
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "AutoBoxing"
        }
    .end annotation

    .line 1
    check-cast p2, Ljava/lang/Float;

    .line 2
    .line 3
    check-cast p3, Ljava/lang/Float;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ly/j;->a(FLjava/lang/Float;Ljava/lang/Float;)Ljava/lang/Float;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
