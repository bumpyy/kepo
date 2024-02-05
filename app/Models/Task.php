<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Task extends Model
{
    use HasFactory;

    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = [];

    // /**
    //  * Get the site associated with the Task
    //  *
    //  * @return \Illuminate\Database\Eloquent\Relations\HasOne
    //  */
    // public function site(): belongsTo
    // {
    //     return $this->hasOne(Site::class, 'id', 'site_id');
    // }

    /**
     * Get the site that owns the Task
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function site(): BelongsTo
    {
        return $this->belongsTo(Site::class,  'site_id', 'id');
    }
}
