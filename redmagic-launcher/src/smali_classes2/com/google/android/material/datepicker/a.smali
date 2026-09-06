.class public final Lcom/google/android/material/datepicker/a;
.super Ljava/lang/Object;
.source "CalendarConstraints.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/datepicker/a$b;,
        Lcom/google/android/material/datepicker/a$c;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/google/android/material/datepicker/a;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final g:Lcom/google/android/material/datepicker/k;

.field private final h:Lcom/google/android/material/datepicker/k;

.field private final i:Lcom/google/android/material/datepicker/a$c;

.field private j:Lcom/google/android/material/datepicker/k;

.field private final k:I

.field private final l:I

.field private final m:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/material/datepicker/a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/material/datepicker/a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/android/material/datepicker/a;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>(Lcom/google/android/material/datepicker/k;Lcom/google/android/material/datepicker/k;Lcom/google/android/material/datepicker/a$c;Lcom/google/android/material/datepicker/k;I)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    const-string v0, "start cannot be null"

    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    const-string v0, "end cannot be null"

    invoke-static {p2, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 5
    const-string v0, "validator cannot be null"

    invoke-static {p3, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    iput-object p1, p0, Lcom/google/android/material/datepicker/a;->g:Lcom/google/android/material/datepicker/k;

    .line 7
    iput-object p2, p0, Lcom/google/android/material/datepicker/a;->h:Lcom/google/android/material/datepicker/k;

    .line 8
    iput-object p4, p0, Lcom/google/android/material/datepicker/a;->j:Lcom/google/android/material/datepicker/k;

    .line 9
    iput p5, p0, Lcom/google/android/material/datepicker/a;->k:I

    .line 10
    iput-object p3, p0, Lcom/google/android/material/datepicker/a;->i:Lcom/google/android/material/datepicker/a$c;

    if-eqz p4, :cond_1

    .line 11
    invoke-virtual {p1, p4}, Lcom/google/android/material/datepicker/k;->a(Lcom/google/android/material/datepicker/k;)I

    move-result p3

    if-gtz p3, :cond_0

    goto :goto_0

    .line 12
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "start Month cannot be after current Month"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_0
    if-eqz p4, :cond_3

    .line 13
    invoke-virtual {p4, p2}, Lcom/google/android/material/datepicker/k;->a(Lcom/google/android/material/datepicker/k;)I

    move-result p3

    if-gtz p3, :cond_2

    goto :goto_1

    .line 14
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "current Month cannot be after end Month"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    :goto_1
    if-ltz p5, :cond_4

    .line 15
    invoke-static {}, Lcom/google/android/material/datepicker/q;->i()Ljava/util/Calendar;

    move-result-object p3

    const/4 p4, 0x7

    invoke-virtual {p3, p4}, Ljava/util/Calendar;->getMaximum(I)I

    move-result p3

    if-gt p5, p3, :cond_4

    .line 16
    invoke-virtual {p1, p2}, Lcom/google/android/material/datepicker/k;->z(Lcom/google/android/material/datepicker/k;)I

    move-result p3

    add-int/lit8 p3, p3, 0x1

    iput p3, p0, Lcom/google/android/material/datepicker/a;->m:I

    .line 17
    iget p2, p2, Lcom/google/android/material/datepicker/k;->i:I

    iget p1, p1, Lcom/google/android/material/datepicker/k;->i:I

    sub-int/2addr p2, p1

    add-int/lit8 p2, p2, 0x1

    iput p2, p0, Lcom/google/android/material/datepicker/a;->l:I

    return-void

    .line 18
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "firstDayOfWeek is not valid"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method synthetic constructor <init>(Lcom/google/android/material/datepicker/k;Lcom/google/android/material/datepicker/k;Lcom/google/android/material/datepicker/a$c;Lcom/google/android/material/datepicker/k;ILcom/google/android/material/datepicker/a$a;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/google/android/material/datepicker/a;-><init>(Lcom/google/android/material/datepicker/k;Lcom/google/android/material/datepicker/k;Lcom/google/android/material/datepicker/a$c;Lcom/google/android/material/datepicker/k;I)V

    return-void
.end method

.method static synthetic a(Lcom/google/android/material/datepicker/a;)Lcom/google/android/material/datepicker/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/datepicker/a;->g:Lcom/google/android/material/datepicker/k;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic b(Lcom/google/android/material/datepicker/a;)Lcom/google/android/material/datepicker/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/datepicker/a;->h:Lcom/google/android/material/datepicker/k;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic e(Lcom/google/android/material/datepicker/a;)Lcom/google/android/material/datepicker/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/datepicker/a;->j:Lcom/google/android/material/datepicker/k;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic g(Lcom/google/android/material/datepicker/a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/datepicker/a;->k:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic h(Lcom/google/android/material/datepicker/a;)Lcom/google/android/material/datepicker/a$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/datepicker/a;->i:Lcom/google/android/material/datepicker/a$c;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/google/android/material/datepicker/a;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/google/android/material/datepicker/a;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/google/android/material/datepicker/a;->g:Lcom/google/android/material/datepicker/k;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/google/android/material/datepicker/a;->g:Lcom/google/android/material/datepicker/k;

    .line 16
    .line 17
    invoke-virtual {v1, v3}, Lcom/google/android/material/datepicker/k;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Lcom/google/android/material/datepicker/a;->h:Lcom/google/android/material/datepicker/k;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/google/android/material/datepicker/a;->h:Lcom/google/android/material/datepicker/k;

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Lcom/google/android/material/datepicker/k;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-object v1, p0, Lcom/google/android/material/datepicker/a;->j:Lcom/google/android/material/datepicker/k;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/google/android/material/datepicker/a;->j:Lcom/google/android/material/datepicker/k;

    .line 36
    .line 37
    invoke-static {v1, v3}, LI/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iget v1, p0, Lcom/google/android/material/datepicker/a;->k:I

    .line 44
    .line 45
    iget v3, p1, Lcom/google/android/material/datepicker/a;->k:I

    .line 46
    .line 47
    if-ne v1, v3, :cond_2

    .line 48
    .line 49
    iget-object p0, p0, Lcom/google/android/material/datepicker/a;->i:Lcom/google/android/material/datepicker/a$c;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/google/android/material/datepicker/a;->i:Lcom/google/android/material/datepicker/a$c;

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_2

    .line 58
    .line 59
    return v0

    .line 60
    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/datepicker/a;->g:Lcom/google/android/material/datepicker/k;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/material/datepicker/a;->h:Lcom/google/android/material/datepicker/k;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/google/android/material/datepicker/a;->j:Lcom/google/android/material/datepicker/k;

    .line 6
    .line 7
    iget v3, p0, Lcom/google/android/material/datepicker/a;->k:I

    .line 8
    .line 9
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    iget-object p0, p0, Lcom/google/android/material/datepicker/a;->i:Lcom/google/android/material/datepicker/a$c;

    .line 14
    .line 15
    filled-new-array {v0, v1, v2, v3, p0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method j(Lcom/google/android/material/datepicker/k;)Lcom/google/android/material/datepicker/k;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/material/datepicker/a;->g:Lcom/google/android/material/datepicker/k;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/google/android/material/datepicker/k;->a(Lcom/google/android/material/datepicker/k;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/google/android/material/datepicker/a;->g:Lcom/google/android/material/datepicker/k;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/google/android/material/datepicker/a;->h:Lcom/google/android/material/datepicker/k;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lcom/google/android/material/datepicker/k;->a(Lcom/google/android/material/datepicker/k;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-lez v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/google/android/material/datepicker/a;->h:Lcom/google/android/material/datepicker/k;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    return-object p1
.end method

.method public l()Lcom/google/android/material/datepicker/a$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/datepicker/a;->i:Lcom/google/android/material/datepicker/a$c;

    .line 2
    .line 3
    return-object p0
.end method

.method q()Lcom/google/android/material/datepicker/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/datepicker/a;->h:Lcom/google/android/material/datepicker/k;

    .line 2
    .line 3
    return-object p0
.end method

.method r()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/datepicker/a;->k:I

    .line 2
    .line 3
    return p0
.end method

.method t()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/datepicker/a;->m:I

    .line 2
    .line 3
    return p0
.end method

.method u()Lcom/google/android/material/datepicker/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/datepicker/a;->j:Lcom/google/android/material/datepicker/k;

    .line 2
    .line 3
    return-object p0
.end method

.method v()Lcom/google/android/material/datepicker/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/material/datepicker/a;->g:Lcom/google/android/material/datepicker/k;

    .line 2
    .line 3
    return-object p0
.end method

.method w()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/android/material/datepicker/a;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/google/android/material/datepicker/a;->g:Lcom/google/android/material/datepicker/k;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p2, v0}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 5
    .line 6
    .line 7
    iget-object p2, p0, Lcom/google/android/material/datepicker/a;->h:Lcom/google/android/material/datepicker/k;

    .line 8
    .line 9
    invoke-virtual {p1, p2, v0}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lcom/google/android/material/datepicker/a;->j:Lcom/google/android/material/datepicker/k;

    .line 13
    .line 14
    invoke-virtual {p1, p2, v0}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Lcom/google/android/material/datepicker/a;->i:Lcom/google/android/material/datepicker/a$c;

    .line 18
    .line 19
    invoke-virtual {p1, p2, v0}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 20
    .line 21
    .line 22
    iget p0, p0, Lcom/google/android/material/datepicker/a;->k:I

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
