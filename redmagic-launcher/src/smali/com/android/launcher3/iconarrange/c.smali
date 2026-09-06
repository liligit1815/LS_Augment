.class Lcom/android/launcher3/iconarrange/c;
.super Ljava/lang/Object;
.source "IconArrangePreviewItemAnim.java"


# static fields
.field private static c:Lcom/android/launcher3/iconarrange/b;


# instance fields
.field private a:Landroid/animation/ValueAnimator;

.field private b:Lcom/android/launcher3/iconarrange/b;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/iconarrange/b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, v1, v1}, Lcom/android/launcher3/iconarrange/b;-><init>(FFF)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/iconarrange/c;->c:Lcom/android/launcher3/iconarrange/b;

    .line 8
    .line 9
    return-void
.end method

.method constructor <init>(Lcom/android/launcher3/C2;ILcom/android/launcher3/folder/Folder;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Lcom/android/launcher3/iconarrange/b;IIIIFFI)V
    .locals 10

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    move-object/from16 v0, p6

    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/iconarrange/c;->b:Lcom/android/launcher3/iconarrange/b;

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    new-array v0, v0, [F

    .line 10
    .line 11
    fill-array-data v0, :array_0

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Lcom/android/launcher3/G2;->i([F)Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/android/launcher3/iconarrange/c;->a:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    new-instance v1, Lcom/android/launcher3/iconarrange/c$a;

    .line 21
    .line 22
    move-object v2, p0

    .line 23
    move-object v9, p5

    .line 24
    move/from16 v3, p7

    .line 25
    .line 26
    move/from16 v5, p8

    .line 27
    .line 28
    move/from16 v4, p9

    .line 29
    .line 30
    move/from16 v6, p10

    .line 31
    .line 32
    move/from16 v7, p11

    .line 33
    .line 34
    move/from16 v8, p12

    .line 35
    .line 36
    invoke-direct/range {v1 .. v9}, Lcom/android/launcher3/iconarrange/c$a;-><init>(Lcom/android/launcher3/iconarrange/c;IIIIFFLcom/android/launcher3/n0$a;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/c;->a:Landroid/animation/ValueAnimator;

    .line 43
    .line 44
    new-instance v1, Lcom/android/launcher3/iconarrange/c$b;

    .line 45
    .line 46
    move-object/from16 p7, p0

    .line 47
    .line 48
    move-object/from16 p10, p1

    .line 49
    .line 50
    move/from16 p12, p2

    .line 51
    .line 52
    move-object/from16 p8, p3

    .line 53
    .line 54
    move-object/from16 p9, p4

    .line 55
    .line 56
    move-object/from16 p11, p5

    .line 57
    .line 58
    move-object/from16 p6, v1

    .line 59
    .line 60
    invoke-direct/range {p6 .. p12}, Lcom/android/launcher3/iconarrange/c$b;-><init>(Lcom/android/launcher3/iconarrange/c;Lcom/android/launcher3/folder/Folder;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/C2;Lcom/android/launcher3/n0$a;I)V

    .line 61
    .line 62
    .line 63
    move-object/from16 p1, p6

    .line 64
    .line 65
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/c;->a:Landroid/animation/ValueAnimator;

    .line 69
    .line 70
    move/from16 p1, p13

    .line 71
    .line 72
    int-to-long p1, p1

    .line 73
    invoke-virtual {p0, p1, p2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method static bridge synthetic a(Lcom/android/launcher3/iconarrange/c;)Lcom/android/launcher3/iconarrange/b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/c;->b:Lcom/android/launcher3/iconarrange/b;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public b(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/c;->b:Lcom/android/launcher3/iconarrange/b;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/iconarrange/b;->d()F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/c;->b:Lcom/android/launcher3/iconarrange/b;

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/android/launcher3/iconarrange/b;->e()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/c;->b:Lcom/android/launcher3/iconarrange/b;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/iconarrange/b;->c()F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object v1, p0, Lcom/android/launcher3/iconarrange/c;->b:Lcom/android/launcher3/iconarrange/b;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/android/launcher3/iconarrange/b;->c()F

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/c;->b:Lcom/android/launcher3/iconarrange/b;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/iconarrange/b;->b()Landroid/graphics/drawable/Drawable;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/c;->a:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
