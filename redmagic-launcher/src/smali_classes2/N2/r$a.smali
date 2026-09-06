.class public abstract LN2/r$a;
.super Ljava/lang/Object;
.source "DragZone.kt"

# interfaces
.implements LN2/r;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LN2/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LN2/r$a$a;,
        LN2/r$a$b;
    }
.end annotation


# instance fields
.field private final a:Landroid/graphics/Rect;

.field private final b:Landroid/graphics/Rect;


# direct methods
.method private constructor <init>(Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LN2/r$a;->a:Landroid/graphics/Rect;

    iput-object p2, p0, LN2/r$a;->b:Landroid/graphics/Rect;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/graphics/Rect;Landroid/graphics/Rect;Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LN2/r$a;-><init>(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    return-void
.end method


# virtual methods
.method public a()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, LN2/r$a;->b:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(II)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, LN2/r$b;->a(LN2/r;II)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getBounds()Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, LN2/r$a;->a:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method
